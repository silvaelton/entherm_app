class CreatePrivileges < ActiveRecord::Migration
  def change
    create_table :privileges do |t|
      t.string :name
      t.integer :code
      t.string :system_code
      t.string :system_name
      t.boolean :status, default: true

      t.timestamps null: false
    end

    add_index :privileges, :code, unique: true
  end
end
