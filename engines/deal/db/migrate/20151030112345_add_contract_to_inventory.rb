class AddContractToInventory < ActiveRecord::Migration
  def change
    add_reference :deal_inventory_logs, :contract, index: true
  end
end
