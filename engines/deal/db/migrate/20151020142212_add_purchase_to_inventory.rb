class AddPurchaseToInventory < ActiveRecord::Migration
  def change
    add_reference :deal_inventories, :purchase, index: true
  end
end
