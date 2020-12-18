class CreateRefreshTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :refresh_tokens do |t|
      t.references :user
      t.string :crypted_token
      t.string :token

      t.timestamps
    end
  end
end
