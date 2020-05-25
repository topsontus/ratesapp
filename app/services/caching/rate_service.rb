module Caching
  class RateService < BaseService
    private

    def record
      @_record ||= Rate.order(created_at: :desc)
                       .where(currency_from: key[0..2], currency_to: key[3..-1])
                       .first_or_initialize
    end
  end
end
