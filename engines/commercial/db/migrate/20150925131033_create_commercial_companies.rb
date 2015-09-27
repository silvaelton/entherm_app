class CreateCommercialCompanies < ActiveRecord::Migration
  def change
    create_table :commercial_companies do |t|
      t.string :name
      t.string :cnpj 
      
      t.references :city, index: true
      t.references :state, index: true
      
      t.string :address
      t.string :address_complement
      t.string :cep
      
      t.string :telephone
      t.string :telephone_optional

      t.timestamps null: false
    end
  end
end
