class CreateQuizQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :quiz_questions do |t|
      t.references :quiz
      t.string :label
      t.string :description
      t.integer :score

      t.timestamps null: false
    end
  end
end
