class CreatePersonalDepartamentSectors < ActiveRecord::Migration
  def change
    create_table :personal_departament_sectors do |t|
      t.string :title
      t.string :description
      t.references :contract, index: true
      t.boolean :status, default: true
      t.timestamps null: false
    end
  end
end
