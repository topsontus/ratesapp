class Rate < ApplicationRecord
  validates :rate, :forced_rate, :forced_rate_expiration, presence: true
  validates :rate, :forced_rate, numericality: true

  def expired?
    return true unless forced_rate_expiration

    forced_rate_expiration < Time.current
  end

  def expiration_period
    return unless forced_rate_expiration

    period = forced_rate_expiration - Time.current
    period.negative? ? nil : period.round.seconds
  end
end
