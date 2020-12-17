# frozen_string_literal: true

# == Schema Information
#
# Table name: take_answers
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  quiz_answer_id   :bigint
#  quiz_question_id :bigint
#  take_quiz_id     :bigint
#
# Indexes
#
#  index_take_answers_on_quiz_answer_id    (quiz_answer_id)
#  index_take_answers_on_quiz_question_id  (quiz_question_id)
#  index_take_answers_on_take_quiz_id      (take_quiz_id)
#
class TakeAnswer < ApplicationRecord

  belongs_to :quiz_question
  belongs_to :quiz_answer
  belongs_to :take_quiz

end
