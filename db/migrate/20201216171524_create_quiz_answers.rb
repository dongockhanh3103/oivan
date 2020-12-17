class CreateQuizAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :quiz_answers do |t|
      t.references :quiz_question
      t.string :content
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
