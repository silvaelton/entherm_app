class CreateDealOrderItems < ActiveRecord::Migration
  def change
    create_table :deal_order_items do |t|
      t.references :order, index: true#, foreign_key: true
      t.references :product, index: true#, foreign_key: true
      t.string  :unit
      t.integer :quantity
      t.string :goal
      t.text :observation


      t.timestamps null: false
    end
  end
end
