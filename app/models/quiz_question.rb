# frozen_string_literal: true

# == Schema Information
#
# Table name: quiz_questions
#
#  id          :bigint           not null, primary key
#  description :string
#  label       :string
#  score       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  quiz_id     :bigint
#
# Indexes
#
#  index_quiz_questions_on_quiz_id  (quiz_id)
#
class QuizQuestion < ApplicationRecord

  has_many :quiz_answers, dependent: :destroy
  belongs_to :quiz

end
