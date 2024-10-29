FactoryBot.define do
  factory :user do
    name { "John" }
    surname { "Doe" }
    patronymic { "Henry" }
    nationality { "English" }
    country { "UK" }
    gender { "male" }
    age { 25 }
    sequence(:email) { |n| "person#{n}@example.com" }
  end
end
