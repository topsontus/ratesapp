class RatesController < ApplicationController
  def index
    render :index, locals: { rate: Caching::RateService.new(key: 'USDRUB').get }
  end
end
