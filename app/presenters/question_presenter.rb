# frozen_string_literal: true

class QuestionPresenter

  delegate :id,
           :label,
           :description,
          to: :@question

  # Initiate Question
  def initialize(question)
    @question = question
  end

  # @return [Integer] The id of Question
  def id
    @question.id
  end

  # @return [String] The name of Question
  def label
    @question.label
  end

  # @return [String] The description of Question
  def description
    @question.description
  end

  # @return [String] The description of Question
  def answers
    @question.quiz_answers.map { |answer| AnswerPresenter.new(answer) }
  end

end
