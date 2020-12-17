json.ignore_nil!

json.data do
  json.array! @questions do |question|
    json.id question.id
    json.label question.label
    json.description question.description
    json.answers question.answers do |answer|
      json.id answer.id
      json.content answer.content
      json.correct answer.correct
    end
  end
end
