FactoryBot.define do
  factory :rate do
    rate                   { Faker::Number.decimal(l_digits: 2) }
    forced_rate            { Faker::Number.decimal(l_digits: 2) }
    currency_from          { 'USD' }
    currency_to            { 'RUB' }
    forced_rate_expiration { Time.current + 1.hour }
  end
end
