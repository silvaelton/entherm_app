class CreateDealQuotations < ActiveRecord::Migration
  def change
    create_table :deal_quotations do |t|
      t.string :description
      t.references :contract, index: true#, foreign_key: true
      t.integer :status, default: 0
      t.references :order, index: true#, foreign_key
      t.timestamps null: false
    end
  end
end
