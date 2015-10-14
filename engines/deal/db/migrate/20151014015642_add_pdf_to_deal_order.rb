class AddPdfToDealOrder < ActiveRecord::Migration
  def change
    add_column :deal_orders, :pdf, :string
  end
end
