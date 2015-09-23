class CreateDealSuppliers < ActiveRecord::Migration
  def change
    create_table :deal_suppliers do |t|
      t.string :name
      t.string :address
      t.string :address_complement
      t.string :cep

      t.references :city, index: true
      t.references :state, index: true
      
      t.string :cnpj

      t.string :contact_name
      t.string :contact_name_optional
      
      t.string :contact_telephone
      t.string :contact_telephone_optional
      
      t.string :contact_celphone
      t.string :contact_celphone_optional

      t.string :location_gps
      t.string :observation
      
      t.string :supplier_category, index: true

      t.timestamps null: false
    end
  end
end
