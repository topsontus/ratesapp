class ImportRateWorker
  include Sidekiq::Worker

  URI = ENV['CB_URI'].freeze

  def perform
    return unless rate.errors.full_messages.blank? && rate.expired?

    ActionCable.server.broadcast('rate', { rate: rate.rate, updated_at: rate.updated_at })
  end

  private

  def rate
    @_rate ||= Caching::RateService.new(key: 'USDRUB', params: { rate: rate_value }).set
  end

  def rate_value
    JSON.parse(Net::HTTP.get(URI(URI))).dig('Valute', 'USD', 'Value')
  end
end
