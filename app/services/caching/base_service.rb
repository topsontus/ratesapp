module Caching
  class BaseService
    attr_reader :key, :params

    def initialize(key:, params: nil)
      @key = key
      @params = params
    end

    def get
      cached = Rails.cache.read(key)
      cached.presence || set
    end

    def set
      params&.keys&.each { |key| record[key] = params[key] }

      Rails.cache.write(key, record) if record.save

      record
    end

    private

    def record
      raise NotImplementedError
    end
  end
end
