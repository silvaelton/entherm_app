class CreateDealInvetories < ActiveRecord::Migration
  def change
    create_table :deal_inventories do |t|
      t.references :product, index: true#, foreign_key: true
      t.integer :quantity
      t.text :observation
      t.text :location
      t.string :image_path

      t.timestamps null: false
    end
  end
end
