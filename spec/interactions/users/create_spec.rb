require 'rails_helper'

RSpec.describe Users::Create, type: :service do
  let(:user) { build(:user) }

  let(:valid_params) do
    {
      "name" => user.name,
      "surname" => user.surname,
      "patronymic" => user.patronymic,
      "email" => user.email,
      "nationality" => user.nationality,
      "country" => user.country,
      "gender" => user.gender,
      "age" => user.age,
      "interests" => "Interest 1, Interest 2",
      "skills" => "Skill 1, Skill 2"
    }
  end

  before do
    create(:interest, name: "Interest 1")
    create(:interest, name: "Interest 2")
    create(:skill, name: "Skill 1")
    create(:skill, name: "Skill 2")
  end

  context "with valid params" do
    it "creates a new user with full name" do
      result = described_class.run(params: valid_params)
      expect(result.valid?).to be true
      expect(result.result.user_full_name).to eq("#{user.surname} #{user.name} #{user.patronymic}")
    end

    it "associates interests to the user" do
      result = described_class.run(params: valid_params)
      expect(result.result.interests.pluck(:name)).to contain_exactly("Interest 1", "Interest 2")
    end

    it "associates skills to the user" do
      result = described_class.run(params: valid_params)
      expect(result.result.skills.pluck(:name)).to contain_exactly("Skill 1", "Skill 2")
    end

    context "when interests and skills are blank" do
      let(:valid_params) do
        {
          "name" => user.name,
          "surname" => user.surname,
          "patronymic" => user.patronymic,
          "email" => user.email,
          "nationality" => user.nationality,
          "country" => user.country,
          "gender" => user.gender,
          "age" => user.age
        }
      end

      it "creates a new user without skills or interests" do
        result = described_class.run(params: valid_params)
        expect(result.valid?).to be true
        expect(result.result.interests).to be_empty
        expect(result.result.skills).to be_empty
      end
    end
  end

  context "with invalid params" do
    it "fails if required fields are missing" do
      invalid_params = valid_params.except("name")
      result = described_class.run(params: invalid_params)
      expect(result.valid?).to be false
      expect(result.errors.full_messages).to include("Params name is required")
    end

    it "fails if email is already taken" do
      create(:user, email: valid_params["email"])
      result = described_class.run(params: valid_params)
      expect(result.valid?).to be false
      expect(result.errors.full_messages).to include("Email already exists")
    end

    it "fails if age is out of range" do
      invalid_params = valid_params.merge("age" => 100)
      result = described_class.run(params: invalid_params)
      expect(result.valid?).to be false
      expect(result.errors.full_messages).to include("Age must be in 0-90 range")
    end

    it "fails if gender is invalid" do
      invalid_params = valid_params.merge("gender" => "other")
      result = described_class.run(params: invalid_params)
      expect(result.valid?).to be false
      expect(result.errors.full_messages).to include("Gender must be male or female")
    end
  end
end
