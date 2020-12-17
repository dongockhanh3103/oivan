# frozen_string_literal: true

class QuizPresenter

  delegate :id,
           :name,
           :description,
          to: :@quiz

  # Initiate Quiz
  def initialize(quiz)
    @quiz = quiz
  end

  # @return [Integer] The id of Quiz
  def id
    @quiz.id
  end

  # @return [Integer] The number questions of Quiz
  def questions_count
    @quiz.quiz_questions.count
  end

  # @return [String] The name of Quiz
  def name
    @quiz.name
  end

  # @return [String] The description of Quiz
  def description
    @quiz.description
  end

end
