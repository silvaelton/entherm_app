class CreateDealOrders < ActiveRecord::Migration
  def change
    create_table :deal_orders do |t|
      t.references :user, index: true#, foreign_key: true
      t.references :contract, index: true#, foreign_key: true
      t.text :description
      t.integer :status, default: 0
      t.string :image_path
      t.json :pdfs

      t.timestamps null: false
    end
  end
end
