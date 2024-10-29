class Skil < ApplicationRecord
  has_many :user_skils
  has_many :users, through: :user_skils
end
