require 'rails_helper'

RSpec.describe Caching::RateService, type: :service do
  let(:memory_store) { ActiveSupport::Cache.lookup_store(:memory_store) }
  let(:cache) { Rails.cache }

  before do
    allow(Rails).to receive(:cache).and_return(memory_store)
    cache.clear
  end

  let!(:rate) { create :rate }
  let(:key) { 'USDRUB' }

  describe '#get' do
    it 'returns a record' do
      expect(described_class.new(key: 'USDRUB').get).to eq rate
    end

    context 'when a record has already existed in the Redis' do
      before { cache.write(key, rate) }

      it 'does not overwrite a record' do
        expect { described_class.new(key: 'USDRUB').get }.not_to change { cache.read(key) }
      end
    end

    context 'when a record has not existed in the Redis yet' do
      it 'creates a new record' do
        expect do
          described_class.new(key: 'USDRUB').get
        end.to change { cache.read(key) }.from(nil).to(rate)
      end
    end
  end

  describe '#set' do
    let(:params) { { forced_rate: 70.5, forced_rate_expiration: Time.current + 1.day } }
    let(:new_rate) do
      create :rate, forced_rate: params[:forced_rate],
             forced_rate_expiration: params[:forced_rate_expiration]
    end

    it 'returns a record' do
      expect(described_class.new(key: 'USDRUB').set).to eq rate
    end

    context 'when a record has already existed in the Redis' do
      before { cache.write(key, rate) }

      it 'overwrites a record' do
        expect do
          described_class.new(key: 'USDRUB', params: params).set
        end.to change{ cache.read(key) }.from(rate).to(new_rate)
      end
    end

    context 'when a record has not existed in the Redis yet' do
      it 'creates a new record' do
        expect do
          described_class.new(key: 'USDRUB', params: params).set
        end.to change{ cache.read(key) }.from(nil).to(rate)
      end
    end

    context 'when record can not be saved' do
      before { params[:forced_rate] = 'invalid params' }

      it 'does not create a record in the Redis' do
        expect { described_class.new(key: 'USDRUB', params: params).set }.not_to change { cache.read(key) }
      end
    end
  end
end
