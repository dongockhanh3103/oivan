# frozen_string_literal: true

class TakeAnswerPresenter

  delegate :id,
           :answer_id,
           :question_id,
          to: :@take_answer

  # Initiate take_answer
  def initialize(take_answer)
    @take_answer = take_answer
  end

  # @return [Integer] The id of take_answer
  def id
    @take_answer.id
  end

  # @return [Integer] The question id
  def question_id
    @take_answer.quiz_question_id
  end

  # @return [Integer] The Answer id
  def answer_id
    @take_answer.quiz_answer_id
  end

end
