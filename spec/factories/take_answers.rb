FactoryBot.define do
  factory :take_answer do
    take_quiz
    quiz_question
    quiz_answer
  end
end
