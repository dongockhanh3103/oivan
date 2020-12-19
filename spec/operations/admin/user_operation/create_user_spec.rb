require 'rails_helper'

describe Admin::UserOperation::CreateUser do
  valid_parameter = {
    email:                 'teacher@example.com',
    name:                  'Teacher Ba',
    role:                  'teacher',
    password:              '12345678',
    password_confirmation: '12345678'
  }

  invalid_parameter = {
    email:                 'teacher@example.com',
    name:                  'Teacher Ba',
    role:                  'teacher',
    password:              '12345678',
    password_confirmation: '123456789'
  }

  context 'when created user successfully' do
    it 'with valid parameters' do
      result = described_class.execute(valid_parameter)
      user = User.first

      expect(result).to be_present
      expect(result[:success]).to be true
      expect(user).to be_present
      expect(user.email).to eq(valid_parameter[:email])
      expect(user.valid_password?(valid_parameter[:password])).to be true
    end
  end

  context 'when created user failure' do
    it 'with invalid parameters' do
      result = described_class.execute(invalid_parameter)
      user = User.first

      expect(result).to be_present
      expect(result[:success]).to be false
      expect(user).to eq(nil)
    end

    it 'with same email' do
      create(:user, email: 'teacher@example.com')
      result = described_class.execute(valid_parameter)

      expect(result).to be_present
      expect(result[:success]).to be false
    end
  end
end
