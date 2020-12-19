FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "user_#{n}@example.com"
    end

    sequence :name do |n|
      "name_#{n}"
    end

    password { '12345678' }

    trait :teacher do
      role { User.roles[:teacher] }
    end

    trait :student do
      role { User.states[:student] }
    end
  end
end
