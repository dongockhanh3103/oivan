require 'rails_helper'

describe 'take_quizzes#create (POST /api/v1/take_quizzes)', type: :request do
  before do
    quiz = Quiz.includes(quiz_questions: [:quiz_answers]).first
    questions_and_answers = []
    quiz.quiz_questions.each do |question|
      answer = question.quiz_answers.first.id
      questions_and_answers << { question: question.id, answer: answer.to_i }
    end

    @valid_params = {
      quiz_id:   quiz.id,
      start_at:  Time.now,
      finish_at: 1.hours.from_now,
      results:   questions_and_answers
    }
  end

  context 'when save the take quiz successfully ' do
    it 'with valid params' do
      post '/api/v1/take_quizzes', params: @valid_params, headers: @headers
      body_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(body_json['status']).to eq('success')
    end
  end

  context 'when save the take quiz failure ' do
    it 'with empty params' do
      post '/api/v1/take_quizzes', headers: @headers

      expect(response.status).to eq(422)
    end

    it 'with no authentication' do
      post '/api/v1/take_quizzes', params: @valid_params

      expect(response.status).to eq(401)
    end
  end
end
