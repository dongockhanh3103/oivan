json.ignore_nil!

json.data do
  json.array! @quizzes do |quiz|
    json.id quiz.id
    json.name quiz.name
    json.description quiz.description
    json.questions_count quiz.questions_count
  end
end
