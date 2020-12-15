class AddRoleAndRefreshTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :integer, default: 0
    add_column :users, :refresh_token, :text
  end
end
