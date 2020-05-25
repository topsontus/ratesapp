require 'rails_helper'

RSpec.describe RateChannel, type: :channel do
  before { subscribe }

  it 'subscribes to a stream' do
    expect(subscription).to be_confirmed
    expect(subscription.streams).to include('rate')
  end
end
