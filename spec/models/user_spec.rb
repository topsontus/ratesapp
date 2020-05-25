require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations and validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
