class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :skill
      t.string :description
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
