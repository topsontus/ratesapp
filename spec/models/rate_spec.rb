require 'rails_helper'

RSpec.describe Rate, type: :model do
  describe 'associations and validations' do
    it { is_expected.to validate_presence_of(:rate) }
    it { is_expected.to validate_presence_of(:forced_rate) }
    it { is_expected.to validate_presence_of(:forced_rate_expiration) }
  end
end
