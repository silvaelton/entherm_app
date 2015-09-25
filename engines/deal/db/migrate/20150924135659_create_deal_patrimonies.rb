class CreateDealPatrimonies < ActiveRecord::Migration
  def change
    create_table :deal_patrimonies do |t|
      t.string :title
      t.text :description
      t.string :image_path
      t.string :location
      t.float :estimated_value
      t.float :original_value
      t.integer :state, default: 0
      t.references :contract, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
