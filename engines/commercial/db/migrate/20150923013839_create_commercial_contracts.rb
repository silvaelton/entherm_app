class CreateCommercialContracts < ActiveRecord::Migration
  def change
    create_table :commercial_contracts do |t|
      t.string :title, unique: true
      t.boolean :status, default: true
      t.references :company, index: true
      t.timestamps null: false
    end
  end
end
