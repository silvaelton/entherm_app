class AddCodeToPatrimony < ActiveRecord::Migration
  def change
    add_column :deal_patrimonies, :code, :string
  end
end
