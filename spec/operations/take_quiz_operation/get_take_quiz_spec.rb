require 'rails_helper'

describe TakeQuizOperation::GetTakeQuiz do
  let!(:user)          { create(:user, email: 'teacher@example.com', role: :teacher) }
  let!(:student)       { create(:user, email: 'student@example.com', role: :student) }
  let!(:quiz)          { create(:quiz, user: user) }
  let!(:quiz_question) { create(:quiz_question, quiz: quiz) }
  let!(:quiz_answer)   { create(:quiz_answer, quiz_question: quiz_question) }
  let!(:take_quiz)     { create(:take_quiz, quiz: quiz, user: student) }
  let!(:take_answer)   { create(:take_answer, quiz_question: quiz_question, quiz_answer: quiz_answer) }

  context 'when get take quiz successfully' do
    it 'with valid parameters' do
      result = described_class.execute({ id: take_quiz.id })

      expect(result).to be_present
      expect(result[:success]).to be true
      expect(result[:quiz]).to be_present
      expect(result[:questions]).to be_present
      expect(result[:take_quiz]).to be_present
    end
  end

  context 'when get take quiz failure' do
    it 'with invalid parameters' do
      result = described_class.execute({ id: -1 })

      expect(result).to be_present
      expect(result[:success]).to be(false)
    end
  end
end
