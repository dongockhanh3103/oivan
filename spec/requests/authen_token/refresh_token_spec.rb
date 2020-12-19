require 'rails_helper'

describe 'authen_token#refresh_token (POST /api/v1/authen_token/refresh_token)', type: :request do
  context 'when get refresh_token failure' do
    it 'with empty params' do
      headers = { ACCEPT: :'application/json' }
      post '/api/v1/authen_token', headers: headers

      expect(response.status).to eq(422)
    end
  end
end
