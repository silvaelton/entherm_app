class CreateDealInventoryLogs < ActiveRecord::Migration
  def change
    create_table :deal_inventory_logs do |t|
      t.integer :log_type, integer: 0
      t.integer :quantity
      t.references :user, index: true
      t.string  :name
      t.string  :description
      t.references :inventory, index: true
      t.timestamps null: false
    end
  end
end
