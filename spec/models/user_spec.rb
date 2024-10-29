require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'validations' do
    it { is_expected.to have_many(:user_interests) }
    it { is_expected.to have_many(:user_skills) }
    it { is_expected.to have_many(:interests) }
    it { is_expected.to have_many(:skills) }

    it { is_expected.to validate_presence_of(:email) }
  end
end
