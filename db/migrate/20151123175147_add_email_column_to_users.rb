class AddEmailColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :admin, :boolean
    add_column :users, :role, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
