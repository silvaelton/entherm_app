class AddOrderToComments < ActiveRecord::Migration
  def change
    add_reference :deal_order_comments, :order, index: true
  end
end
