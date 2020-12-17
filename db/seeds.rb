# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Quiz.destroy_all

teacher = User.create!(email: 'teacher@example.com', name: 'Ziv', password: '12345678', password_confirmation: '12345678', role: :teacher)
student = User.create!(email: 'ziv@example.com', name: 'khanhdo', password: '12345678', password_confirmation: '12345678', role: :student)
subjects = ['Math', 'English', 'Geography', 'History', 'Physical']

subjects.each do |subject|
  quiz = Quiz.create!(name: subject, description: "Quiz about #{subject}", user_id: teacher.id)

  5.times do |q|
    score = rand(1..5)
    question = QuizQuestion.create!(quiz_id: quiz.id, label: "Question #{q+1}", description: "Question #{subject} #{q+1}:", score: score)
    correct_answer = rand(4)

    ('A'..'D').each_with_index do |r, i|
      QuizAnswer.create!(content: r, quiz_question_id: question.id, correct: i == correct_answer)
    end
  end
end