class AddIcmsToPurchase < ActiveRecord::Migration
  def change
    add_column :deal_purchases, :icms, :string
  end
end
