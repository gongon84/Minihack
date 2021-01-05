class AddNameOldProfileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :old, :string
    add_column :users, :profile, :string
  end
end
