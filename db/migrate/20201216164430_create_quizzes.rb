class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.references :user
      t.string :name
      t.text :description
      t.integer :score, default: 0

      t.timestamps null: false
    end
  end
end
