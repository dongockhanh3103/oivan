# frozen_string_literal: true

module Admin
  module QuizOperation
    class CreateQuiz < BaseOperation

      def initialize(param, user)
        @param = param
        @user = user
      end

      # Create a Quiz
      #
      # @return [Hash] The result after handle create Quiz
      def execute
        Quiz.create!(name: @param[:name], description: @param[:description])

        { success: true }
      end

    end
  end
end
