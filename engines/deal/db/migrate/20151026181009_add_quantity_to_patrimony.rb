class AddQuantityToPatrimony < ActiveRecord::Migration
  def change
    add_column :deal_patrimonies, :quantity, :integer
  end
end
