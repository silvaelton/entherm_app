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

      t.integer :delivery, default: 0
      t.integer :form_payment, default: 0
      t.string  :deadline_payment

      t.integer :buy_type, default: 0
      
      t.string :seller
      t.string :requester
      t.references :carrier, index: true

      t.integer :freight, default: 0

      t.timestamps null: false
    end
  end
end
