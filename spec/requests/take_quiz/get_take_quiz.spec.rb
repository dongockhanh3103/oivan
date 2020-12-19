require 'rails_helper'

describe 'take_quizzes#show (GET /api/v1/take_quizzes/:id)', type: :request do
  let!(:user)          { User.first }
  let!(:student)       { User.last }
  let!(:quiz)          { create(:quiz, user: user) }
  let!(:quiz_question) { create(:quiz_question, quiz: quiz) }
  let!(:quiz_answer)   { create(:quiz_answer, quiz_question: quiz_question) }
  let!(:take_quiz)     { create(:take_quiz, quiz: quiz, user: student) }
  let!(:take_answer)   { create(:take_answer, quiz_question: quiz_question, quiz_answer: quiz_answer) }

  context 'when take quiz successfully ' do
    it 'with valid id' do
      get "/api/v1/take_quizzes/#{take_quiz.id}", headers: @headers

      body_json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(body_json['status']).to eq('success')
      expect(body_json['data']['take_quiz']['start_at']).to eq(take_quiz.start_at)
      expect(body_json['data']['take_quiz']['finish_at']).to eq(take_quiz.finish_at)
      expect(body_json['data']['take_quiz']['id']).to eq(take_quiz.id)
      expect(body_json['data']['questions'].size).to eq(quiz.quiz_questions.size)
      expect(body_json['data']['quiz']['name']).to eq(quiz.name)
    end
  end

  context 'when get take quiz failure ' do
    it 'with unauthenticated' do
      get "/api/v1/take_quizzes/#{take_quiz.id}", headers: @headers_with_no_auth

      expect(response.status).to eq(401)
    end

    it 'with invalid take quiz id' do
      get '/api/v1/take_quizzes/-1', headers: @headers

      expect(response.status).to eq(422)
    end
  end
end
