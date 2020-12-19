require 'rails_helper'

describe Admin::UserOperation::UpdateUser do
  let!(:user) { create(:user, email: 'teacher@example.com', role: :teacher) }

  context 'when update user successfully' do
    it 'with valid parameters' do
      valid_parameter = {
        email:                 'teacher@example.com',
        name:                  'Teacher Ba',
        role:                  'teacher',
        password:              'teacher123',
        password_confirmation: 'teacher123',
        id:                    user.id
      }
      result = described_class.execute(valid_parameter)
      updated_user = User.first

      expect(result).to be_present
      expect(result[:success]).to be true
      expect(updated_user.name).to eq(valid_parameter[:name])
      expect(updated_user.valid_password?(valid_parameter[:password])).to be true
    end
  end

  context 'when update user failure' do
    it 'with invalid parameters' do
      invalid_parameter = {
        email:                 'teacher@example.com',
        name:                  'Teacher Ba',
        role:                  'teacher',
        password:              'teacher123',
        password_confirmation: 'teacher123'
      }
      result = described_class.execute(invalid_parameter)

      expect(result).to be_present
      expect(result[:success]).to be false
    end
  end
end
