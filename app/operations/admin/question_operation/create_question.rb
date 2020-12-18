# frozen_string_literal: true

module Admin
  module QuestionOperation
    class CreateQuestion < BaseOperation

      # Init params
      def initialize(quiz_id, question)
        @quiz_id = quiz_id
        @question = question
      end

      # Create a Question
      #     {
      #        "label":"Apple",
      #        "description":"An has an apple.
      #                       Bao's going to give An an apple? The apple belongs to An?",
      #        "answers":[
      #           {
      #              "content":"Nothing"
      #           },
      #           {
      #              "content":"2",
      #              "correct": "on"
      #           }
      #        ]
      #     }
      # @return [Hash] The result after handle create Quiz
      def execute
        ActiveRecord::Base.transaction do
          quiz_question = QuizQuestion.create!(
            quiz_id:     @quiz_id,
            label:       @question[:label],
            description: @question[:description]
          )

          if quiz_question.persisted?
            @question[:answers].each do |answer|
              correct = answer[:correct].present?

              QuizAnswer.create!(
                quiz_question_id: quiz_question.id,
                correct:          correct,
                content:          answer[:content]
              )
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
