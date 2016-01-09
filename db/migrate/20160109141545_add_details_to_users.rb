class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :github, :string
    add_column :users, :website, :string
    add_column :users, :baseline, :string
  end
end
