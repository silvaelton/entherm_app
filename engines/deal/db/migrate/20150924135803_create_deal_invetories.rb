class CreateDealInvetories < ActiveRecord::Migration
  def change
    create_table :deal_inventories do |t|
      t.references :product, index: true#, foreign_key: true
      t.integer :quantity
      t.string :unit
      t.text :observation
      t.text :location
      t.string :image_path
      t.string :state
      t.string :supplier
      t.float :estimed_value
      t.references :purchase, index: true

      t.timestamps null: false
    end
  end
end
