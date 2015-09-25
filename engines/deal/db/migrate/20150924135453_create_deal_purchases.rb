class CreateDealPurchases < ActiveRecord::Migration
  def change
    create_table :deal_purchases do |t|
      t.references :quotation, index: true#, foreign_key: true
      t.integer :purchase_type, default: 0
      t.references :contract, index: true#, foreign_key: true
      t.string :description
      t.text :observation
      t.string :invoice_number
      t.string :invoice_file
      t.integer :status, default: 0
      t.references :supplier, index: true#, foreign_key: true
      t.references :order, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
