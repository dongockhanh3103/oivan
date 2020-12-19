require 'rails_helper'

describe 'authen_token#destroy (DELETE /api/v1/authen_token)', type: :request do
  context 'when logout with valid header ' do
    it 'with valid header' do
      delete '/api/v1/authen_token', headers: @headers

      expect(response.status).to eq(200)
    end
  end

  context 'when logout with invalid header ' do
    it 'with empty params' do
      delete '/api/v1/authen_token', headers: @headers_with_no_auth

      expect(response.status).to eq(401)
    end
  end
end
