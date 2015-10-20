class AddInventoryFlagToPurchase < ActiveRecord::Migration
  def change
    add_column :deal_purchases, :inventory_flag, :boolean, default: false
  end
end
