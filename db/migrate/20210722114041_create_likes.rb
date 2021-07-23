class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      #ユーザーと関連付け
      t.references :user, foreign_key: true
      t.references :work, foreign_key: true

      t.timestamps
    end
  end
end
