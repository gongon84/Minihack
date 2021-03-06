class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.string :name
      t.string :comment

      t.timestamps
    end
  end
end
