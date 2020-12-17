# frozen_string_literal: true

module Api
  module V1
    class QuizzesController < Api::V1::ApplicationController

      # GET /api/v1/quizzes
      # Return [Array] List of quiz
      def index
        @quizzes = Quiz.all.map { |quiz| QuizPresenter.new(quiz) }
      end

      # GET /api/v1/quizzes/:id/questions
      # Return [Array] The questions belongs to Quiz
      def get_questions
        result = QuizQuestion.includes(:quiz_answers).where(quiz_id: params[:id])

        @questions = result.map { |question| QuestionPresenter.new(question) }
      end

    end
  end
end
