class CreatePersonalDepartamentJobs < ActiveRecord::Migration
  def change
    create_table :personal_departament_jobs do |t|

      t.string :title
      t.boolean :status, default: true
      t.timestamps null: false 
    end
  end
end
