FactoryBot.define do
  factory :quiz_question do
    quiz
    sequence :label do |n|
      "question_#{n}"
    end

    description do
      'It is a long established fact that a reader will be distracted by
       the readable content of a page when looking at its layout'
    end

    score { 0 }
  end
end
