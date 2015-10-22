class AddMachineIdToOrderItem < ActiveRecord::Migration
  def change
    add_column :deal_order_items, :machine_id, :string
    add_column :deal_order_items, :machine_version, :string
    add_column :deal_order_items, :machine_serial, :string
    add_column :deal_order_items, :contract_value, :float
  end
end
