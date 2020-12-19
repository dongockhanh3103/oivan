require 'rails_helper'

describe 'quizzes#index (GET /api/v1/quizzes)', type: :request do
  context 'when get list quizzes successfully' do
    it 'with existing quizzes' do
      get '/api/v1/quizzes', headers: @headers

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(body['data'].size).to eq(5)
    end
  end

  context 'when get list quizzes failure' do
    it 'with no permission' do
      get '/api/v1/quizzes'

      expect(response.status).to eq(401)
    end
  end
end
