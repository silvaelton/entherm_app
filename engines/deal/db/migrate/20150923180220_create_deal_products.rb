class CreateDealProducts < ActiveRecord::Migration
  def change
    create_table :deal_products do |t|
      t.string :title
      t.text :description
      t.text :observation
      t.string :image_path

      t.timestamps null: false
    end
  end
end
