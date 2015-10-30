class CreateDealPatrimonyMoviments < ActiveRecord::Migration
  def change
    create_table :deal_patrimony_moviments do |t|
      t.references :origin_contract, index: true#, foreign_key: true
      t.references :current_contract, index: true#, foreign_key: true
      t.string :responsible
      t.references :items, array: true
      t.string :moviment_type
      t.references :user, index: true#, foreign_key: true
      t.text :observation

      t.timestamps null: false
    end
  end
end
