class AfterExpirationForcedRateWorker
  include Sidekiq::Worker

  def perform
    rate = Caching::RateService.new(key: 'USDRUB').set
    ActionCable.server.broadcast('rate', { rate: rate.rate, updated_at: rate.updated_at })
  end
end
