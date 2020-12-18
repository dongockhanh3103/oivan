# frozen_string_literal: true

# == Schema Information
#
# Table name: take_quizzes
#
#  id         :bigint           not null, primary key
#  finish_at  :datetime
#  note       :string
#  score      :integer
#  start_at   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quiz_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_take_quizzes_on_quiz_id  (quiz_id)
#  index_take_quizzes_on_user_id  (user_id)
#
class TakeQuiz < ApplicationRecord

  belongs_to :user
  belongs_to :quiz
  has_many :take_answers

end
