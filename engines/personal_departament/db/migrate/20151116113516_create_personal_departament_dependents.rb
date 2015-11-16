class CreatePersonalDepartamentDependents < ActiveRecord::Migration
  def change
    create_table :personal_departament_dependents do |t|
      
      t.references :staff, index: true
      t.string :name
      t.string :cpf
      t.date   :born
      t.boolean :special_condition_flag, default: false
      t.integer  :kinship, default: 0

      t.timestamps null: false
    end
  end
end
