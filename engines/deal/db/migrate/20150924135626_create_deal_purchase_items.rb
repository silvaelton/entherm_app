class CreateDealPurchaseItems < ActiveRecord::Migration
  def change
    create_table :deal_purchase_items do |t|
      t.references :purchase, index: true#, foreign_key: true
      t.references :product, index: true# foreign_key: true
      t.integer :quantity, default: 0
      t.integer :unit, default: 0
      t.float :unit_value, default: 0.00
      t.float :total_value, default: 0.00
      t.float :contract_value, default: 0.00
      t.text :observation

      t.timestamps null: false
    end
  end
end
