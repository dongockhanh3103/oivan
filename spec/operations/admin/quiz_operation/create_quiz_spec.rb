require 'rails_helper'

describe Admin::QuizOperation::CreateQuiz do
  let!(:user) { create(:user, email: 'teacher@example.com', role: :teacher) }

  valid_parameters = {
    quiz:
    {
      name:        'English',
      description: 'Improve youseft'
    },
    questions:
    [
      {
        label:       'Beer',
        description: 'Lorem',
        answers:
        [
          {
            content: 'Yes',
            correct: 'on'
          },
          {
            content: 'No'
          }
        ]
      },
      {
        label:       'Apple',
        description: 'You have 5 apples and Barry stolen a apple. How many apples remaining?',
        answers:
        [
          {
            content: '5',
          },
          {
            content: '4',
            correct: 'on'
          },
          {
            content: '3'
          },
          {
            content: '2'
          }
        ]
      }
    ]
  }

  context 'when create quiz successfully' do
    it 'with valid parameters' do
      params = ActionController::Parameters.new(valid_parameters)
      quiz_params = params.require(:quiz).permit(:name, :description)
      questions_params = params.permit(questions: [:label, :description, answers: %i[content correct]])
      result = described_class.execute(quiz_params, questions_params, user)
      quiz = Quiz.includes(quiz_questions: [:quiz_answers]).first

      expect(result).to be_present
      expect(result[:success]).to be true
      expect(quiz).to be_present
      expect(quiz.name).to eq('English')
      expect(quiz.quiz_questions.count).to eq(2)
    end
  end
end
