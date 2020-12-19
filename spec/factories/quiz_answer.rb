FactoryBot.define do
  factory :quiz_answer do
    quiz_question

    correct { [true, false].sample }
    content { ('A'..'Z').to_a[rand(26)] }
  end
end
