class AddImagePathToDealOrderItem < ActiveRecord::Migration
  def change
    add_column :deal_order_items, :image_path, :string
  end
end
