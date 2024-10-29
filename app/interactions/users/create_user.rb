class Users::CreateUser < ActiveInteraction::Base
  hash :params do
    string :name
    string :surname
    string :patronymic
    string :email
    string :nationality
    string :country
    string :gender
    string :interests, default: nil
    string :skills, default: nil

    integer :age
  end

  def execute
    return unless valid_params?

    user_full_name = [ params["surname"], params["name"], params["patronymic"] ].join(" ")
    user = User.create!(user_params.merge(user_full_name: user_full_name))

    associate_interests(user)
    associate_skills(user)

    user
  end

  private

  def valid_params?
    validate_email && validate_age && validate_gender
  end

  def required_keys
    %w[name surname patronymic email age nationality country gender]
  end

  def user_params
    params.slice(*required_keys)
  end

  def associate_interests(user)
    return if params["interests"].blank?

    interest_names = params["interests"].split(",").map(&:strip)
    interests = Interest.where(name: interest_names)
    user.interests << interests
  end

  def associate_skills(user)
    return if params["skills"].blank?

    skill_names = params["skills"].split(",").map(&:strip)
    skills = Skill.where(name: skill_names)
    user.skills << skills
  end

  def validate_email
    User.find_by(email: params["email"]).nil? ? true : errors.add(:email, "already exists")
  end

  def validate_age
    params["age"].to_i.in?(0..90) ? true : errors.add(:age, "must be in 0-90 range")
  end

  def validate_gender
     %w[male female].include?(params["gender"]) ? true : errors.add(:gender, "must be male or female")
  end
end
