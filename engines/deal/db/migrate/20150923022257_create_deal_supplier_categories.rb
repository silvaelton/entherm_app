class CreateDealSupplierCategories < ActiveRecord::Migration
  def change
    create_table :deal_supplier_categories do |t|
      t.string :title
      t.boolean :status

      t.timestamps null: false
    end
  end
end
