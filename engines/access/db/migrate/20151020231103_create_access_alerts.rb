class CreateAccessAlerts < ActiveRecord::Migration
  def change
    create_table :access_alerts do |t|
      t.string :title
      t.text :content
      t.integer :priority, default: 0
      t.boolean :status, default: false
      t.date :expiration
      t.integer :color, default: 0
      

      t.timestamps null: false
    end
  end
end
