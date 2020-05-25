require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe AfterExpirationForcedRateWorker, type: :worker do
  let(:rate) { create :rate, forced_rate_expiration: Time.current + 1.minute }
  let(:expiration_period) { rate.expiration_period }
  let(:scheduled_job) { described_class.perform_in(expiration_period) }

  it 'goes into the jobs array for testing environment' do
    expect { scheduled_job }.to change(AfterExpirationForcedRateWorker.jobs, :size).by(1)
  end

  it 'occurs in expected time' do
    scheduled_job
    expect(described_class.jobs.last['jid']).to include scheduled_job
    expect(described_class).to have_enqueued_sidekiq_job.in(expiration_period)
  end
end
