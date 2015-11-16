class CreatePersonalDepartamentAnnotations < ActiveRecord::Migration
  def change
    create_table :personal_departament_annotations do |t|
      t.references :staff, index: true
      t.string :title
      t.text :description
      t.date :current_date
      t.string :attachment_path
      
      t.timestamps null: false
    end
  end
end
