# frozen_string_literal: true

module TakeQuizOperation
  class GetTakeQuiz < BaseOperation

    # Init params
    # { id: 1 }
    def initialize(params)
      @params = params
    end

    # Execute Get Take Quiz by Id
    def execute
      ActiveRecord::Base.transaction do
        take_quiz_model = TakeQuiz.includes(quiz: [quiz_questions: [:quiz_answers]]).
                                   includes(:take_answers).
                                   find(@params[:id])
        quiz = QuizPresenter.new(take_quiz_model.quiz)
        questions = take_quiz_model.quiz.quiz_questions.map do |question|
          QuestionPresenter.new(question)
        end
        take_quiz = TakeQuizPresenter.new(take_quiz_model)

        return {
              success:   true,
              quiz:      quiz,
              questions: questions,
              take_quiz: take_quiz
            }
      end

      { success: false }
    end

  end
end
