class User < ApplicationRecord
  has_many :user_interests
  has_many :user_skils
  has_many :interests, through: :user_interests
  has_many :skils, through: :user_skils
end
