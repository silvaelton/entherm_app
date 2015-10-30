class AddUnitToInventory < ActiveRecord::Migration
  def change
    add_column :deal_inventories, :unit, :string
  end
end
