FactoryBot.define do
  factory :take_quiz do
    user
    quiz

    finish_at { 1.hours.from_now }
    start_at { Time.now }

    score { rand(5) }
  end
end
