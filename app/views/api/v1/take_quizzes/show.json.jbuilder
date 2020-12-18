json.ignore_nil!

json.data do
  json.quiz do
    json.id @quiz.id
    json.name @quiz.name
    json.description @quiz.description
  end
  json.questions @questions do |question|
    json.id question.id
    json.label question.label
    json.description question.description
    json.answers question.answers do |answer|
      json.id answer.id
      json.content answer.content
      json.correct answer.correct
    end
  end

  json.take_quiz do
    json.id @take_quiz.id
    json.start_at @take_quiz.start_at
    json.finish_at @take_quiz.finish_at
    json.score @take_quiz.score
    json.questions_and_answers @take_quiz.questions_and_answers do |r|
      json.id r.id
      json.question_id r.question_id
      json.answer_id r.answer_id
    end
  end
end
