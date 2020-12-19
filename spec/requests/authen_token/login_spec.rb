require 'rails_helper'

describe 'authen_token#create (POST /api/v1/authen_token)', type: :request do
  context 'when get login successfully' do
    it 'with valid email and password' do
      params = { email: 'teacher@example.com', password: '12345678' }
      headers = { ACCEPT: :'application/json' }
      post '/api/v1/authen_token', params: params, headers: headers

      body_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(body_json['status']).to eq('success')
      expect(body_json['data']['info']['email']).to eq('teacher@example.com')
      expect(body_json['data']['info']['token']).to be_present
      expect(body_json['data']['info']['refresh_token']).to be_present
    end
  end

  context 'when get login failure' do
    it 'with invalid password' do
      params = { email: 'teacher@example.com', password: 'dummy' }
      headers = { ACCEPT: :'application/json' }
      post '/api/v1/authen_token', params: params, headers: headers

      body_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(body_json['status']).to eq('failed')
    end
  end
end
