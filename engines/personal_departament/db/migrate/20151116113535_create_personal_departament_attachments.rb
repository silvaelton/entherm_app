class CreatePersonalDepartamentAttachments < ActiveRecord::Migration
  def change
    create_table :personal_departament_attachments do |t|
      t.references :staff, index: true
      t.string :title
      t.string :description
      t.string :attachment_path
      
      t.timestamps null: false
    end
  end
end
