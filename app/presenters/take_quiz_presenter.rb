# frozen_string_literal: true

class TakeQuizPresenter

  delegate :id,
           :finish_at,
           :start_at,
           :score,
          to: :@take_quiz

  # Initiate Take Quiz
  def initialize(take_quiz)
    @take_quiz = take_quiz
  end

  # @return [Integer] The id of TakeQuiz
  def id
    @take_quiz.id
  end

  # @return [Datetime] The finish date of Take Quiz
  def finish_at
    @take_quiz.finish_at
  end

  # @return [Datetime] The start date of Take Quiz
  def start_at
    @take_quiz.start_at
  end

  # @return [Integer] The id of TakeQuiz
  def score
    @take_quiz.score
  end

  # @return [Array] The question and answer of Take answer
  def questions_and_answers
    @take_quiz.take_answers.map { |ta| TakeAnswerPresenter.new(ta) }
  end

end
