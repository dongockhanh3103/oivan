FactoryBot.define do
  factory :quiz do
    user
    sequence :name do |n|
      "subject_#{n}"
    end

    description { 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.' }

    score { 0 }
  end
end
