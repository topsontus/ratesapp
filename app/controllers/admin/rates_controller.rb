module Admin
  class RatesController < ApplicationController
    before_action :authenticate_user!

    def index
      render :index, locals: { rate: Caching::RateService.new(key: 'USDRUB').get }
    end

    def create
      return set_rate unless rate.error_message

      render json: rate.error_message, status: :bad_request
    end

    private

    def set_rate
      ActionCable.server.broadcast(
        'rate', { forced_rate: rate.forced_rate, forced_rate_expiration: rate.forced_rate_expiration }
      )

      ::AfterExpirationForcedRateWorker.perform_in(rate.expiration_period)
    end

    def rate
      @_rate ||= Caching::RateService.new(key: 'USDRUB', params: rate_params).set
    end

    def rate_params
      params.require(:rate).permit(:forced_rate, :forced_rate_expiration)
    end
  end
end
