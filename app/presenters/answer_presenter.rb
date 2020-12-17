# frozen_string_literal: true

class AnswerPresenter

  delegate :id,
           :content,
           :correct,
          to: :@answer

  # Initiate Quiz
  def initialize(answer)
    @answer = answer
  end

  # @return [Integer] The id of Answer
  def id
    @answer.id
  end

  # @return [String] The content of Answer
  def content
    @answer.content
  end

  # @return [Boolean] The answer correct or not
  def correct
    @answer.correct
  end

end
