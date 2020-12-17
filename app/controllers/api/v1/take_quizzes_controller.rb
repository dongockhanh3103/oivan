# frozen_string_literal: true

module Api
  module V1
    class TakeQuizzesController < Api::V1::ApplicationController

      def show; end

      # POST api/v1/take_quizzes
      #
      # Example params:
      #
      # {
      #   "quiz_id": 11,
      #   "start_at": "2020-12-17 23:00:52 +0700",
      #   "finish_at": "2020-12-17 23:40:52 +0700",
      #   "results": [
      #     { "question": 51, "answer": 202 },
      #     { "question": 52, "answer": 208 },
      #     { "question": 53, "answer": 211 },
      #     { "question": 54, "answer": 214 },
      #     { "question": 55, "answer": 220 }
      #   ]
      # }
      #
      def create
        TakeQuizOperation::SaveTakeQuiz.execute(build_create_take_quizzes_params, current_user)
      end

      private

      def build_create_take_quizzes_params
        params.permit(:quiz_id, :finish_at, :start_at, results: %i[question answer])
      end

    end
  end
end
