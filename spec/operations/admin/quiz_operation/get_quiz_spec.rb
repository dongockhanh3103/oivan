require 'rails_helper'

describe Admin::QuizOperation::GetQuiz do
  let!(:user)          { create(:user, email: 'teacher@example.com', role: :teacher) }
  let!(:quiz)          { create(:quiz, user: user) }
  let!(:quiz_question) { create(:quiz_question, quiz: quiz) }
  let!(:quiz_answer)   { create(:quiz_answer, quiz_question: quiz_question) }

  context 'when get quiz successfully' do
    it 'with valid parameters' do
      result = described_class.execute({ id: quiz.id })

      expect(result).to be_present
      expect(result[:success]).to be true
    end
  end

  context 'when get quiz failure' do
    it 'with invalid parameters' do
      result = described_class.execute({ id: -1 })
      expect(result).to be_present
      expect(result[:success]).to be false
    end
  end
end
