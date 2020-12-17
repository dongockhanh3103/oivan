# frozen_string_literal: true

# == Schema Information
#
# Table name: quiz_answers
#
#  id               :bigint           not null, primary key
#  content          :string
#  correct          :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  quiz_question_id :bigint
#
# Indexes
#
#  index_quiz_answers_on_quiz_question_id  (quiz_question_id)
#
class QuizAnswer < ApplicationRecord

  belongs_to :quiz_question

end
