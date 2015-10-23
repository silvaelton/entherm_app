class AddEstimedValueToInventory < ActiveRecord::Migration
  def change
    add_column :deal_inventories, :estimed_value, :float
  end
end
