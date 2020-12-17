class CreateTakeAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :take_answers do |t|
      t.references :take_quiz
      t.references :quiz_question
      t.references :quiz_answer

      t.timestamps
    end
  end
end
