require 'rails_helper'

RSpec.describe Skill, type: :model do
  subject { build(:skill) }

  describe 'validations' do
    it { is_expected.to have_many(:users) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
