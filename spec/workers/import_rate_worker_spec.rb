require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe ImportRateWorker, type: :worker do
  it 'goes into the jobs array for testing environment' do
    expect { ImportRateWorker.perform_async }.to change(ImportRateWorker.jobs, :size).by(1)
  end
end
