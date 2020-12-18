# frozen_string_literal: true

module Admin
  module QuizOperation
    class GetQuiz < BaseOperation

      # Init params
      def initialize(params)
        @id = params[:id]
      end

      # Return [Hash] { success: <success>, quiz: <quiz>, questions: <question> }
      def execute
        ActiveRecord::Base.transaction do
          quiz = Quiz.includes(quiz_questions: [:quiz_answers]).find(@id)
          questions = quiz.quiz_questions

          return { success: true, quiz: quiz, questions: questions }
        end

        { success: false }
      end

    end
  end
end
