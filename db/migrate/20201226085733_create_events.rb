class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :skill
      t.string :accept_num
      t.string :description
      t.string :url
      t.string :status
      t.string :portfolio
      t.string :portfolio_info

      t.timestamps
    end
  end
end
