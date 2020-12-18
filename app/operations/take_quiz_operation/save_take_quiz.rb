# frozen_string_literal: true

module TakeQuizOperation
  class SaveTakeQuiz < BaseOperation

    # Init params
    def initialize(params, user)
      @quiz_id = params[:quiz_id]
      @start_at = params[:start_at]
      @finish_at = params[:finish_at]
      @results = params[:results]
      @user = user
      @score = 0
      @take_quiz = nil
    end

    # Process create Take Quiz
    # Return [Hash] Success or Failure
    def execute
      ActiveRecord::Base.transaction do
        quiz = Quiz.find_by(id: @quiz_id)

        raise Params::InvalidParamError.new(@quiz_id, "Invalid quiz: #{@quiz_id}") if quiz.nil?
        @take_quiz = TakeQuiz.create!(quiz_id:   @quiz_id,
                                      user_id:   @user.id,
                                      start_at:  @start_at,
                                      finish_at: @finish_at,
                                      score:     0)

        save_take_quiz!
        return { success: true, take_quiz_id: @take_quiz.id }
      end

      { success: false }
    end

    private

    # answers = [{ question: 1, answer: 1 }, { question: 2, answer: 2 }]
    def save_take_quiz!
      @results.each do |result|
        quiz_question = QuizQuestion.includes(:quiz_answers).find_by(id: result[:question])

        if quiz_question.nil?
          raise Params::InvalidParamError.new(@results, "Invalid question: #{result[:question]}")
        end

        if !quiz_question.quiz_answers.pluck(:id).include?(result[:answer])
          raise Params::InvalidParamError.new(@results, "Invalid answer: #{result[:answer]}")
        end
        TakeAnswer.create!(quiz_answer_id:   result[:answer],
                           quiz_question_id: result[:question],
                           take_quiz_id:     @take_quiz.id)

        is_correct = result[:answer] == quiz_question.quiz_answers.where(correct: true).first.id
        @score += quiz_question.score if is_correct
      end

      # Update Score after calculate score
      @take_quiz.update!(score: @score)
    end

  end
end
