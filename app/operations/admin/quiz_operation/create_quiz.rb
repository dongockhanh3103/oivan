# frozen_string_literal: true

module Admin
  module QuizOperation
    class CreateQuiz < BaseOperation

      # Init params
      def initialize(quiz, questions, user)
        @quiz = quiz
        @questions = questions.require(:questions)
        @user = user
      end

      # Create a Quiz
      #
      # @return [Hash] The result after handle create Quiz
      def execute
        ActiveRecord::Base.transaction do
          quiz_model = Quiz.create!(
            name:        @quiz[:name],
            description: @quiz[:description],
            user_id:     @user.id
          )

          if quiz_model.persisted?
            @questions.each do |question|
              Admin::QuestionOperation::CreateQuestion.execute(quiz_model.id, question)
            end
          else
            return { success: false }
          end

          return { success: true }
        end

        { success: false }
      end

    end
  end
end
