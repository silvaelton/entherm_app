class CreateInformationCities < ActiveRecord::Migration
  def change
    create_table :information_cities do |t|
      t.string :name
      t.boolean :capital
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
