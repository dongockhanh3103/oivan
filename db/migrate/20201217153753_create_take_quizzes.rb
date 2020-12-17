class CreateTakeQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :take_quizzes do |t|
      t.references :user
      t.references :quiz
      t.datetime :start_at
      t.datetime :finish_at
      t.integer :score
      t.string :note

      t.timestamps null: false
    end
  end
end
