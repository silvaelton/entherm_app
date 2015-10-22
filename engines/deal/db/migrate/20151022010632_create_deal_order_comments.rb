class CreateDealOrderComments < ActiveRecord::Migration
  def change
    create_table :deal_order_comments do |t|
      t.references :user, index: true#, foreign_key: true
      t.text :content
      t.references :order, index: true# foreign_key: true

      t.timestamps null: false
    end
  end
end
