# frozen_string_literal: true

# == Schema Information
#
# Table name: quizzes
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  score       :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_quizzes_on_user_id  (user_id)
#
class Quiz < ApplicationRecord

  has_many :quiz_questions, dependent: :destroy

end
