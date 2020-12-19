require 'rails_helper'

describe 'quizzes#get_questions (GET /api/v1/quizzes/:id/questions)', type: :request do
  before do
    @quiz = Quiz.first
  end

  context 'when get questions successfully' do
    it 'with existing quizzes' do
      get "/api/v1/quizzes/#{@quiz.id}/questions", headers: @headers

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['data'].size).to eq(5)
    end
  end

  context 'when get list questions of quiz failure' do
    it 'with no permission' do
      get "/api/v1/quizzes/#{@quiz.id}/questions"

      expect(response.status).to eq(401)
    end

    it 'with invalid quiz id' do
      get '/api/v1/quizzes/-1/questions', headers: @headers

      body_json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(body_json['data'].size).to eq(0)
    end
  end
end
