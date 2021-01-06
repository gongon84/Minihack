class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.references :event, foreign_key: true
      t.string :title
      t.string :portfolio_url
      t.string :profile
      t.string :image_name

      t.timestamps
    end
  end
end
