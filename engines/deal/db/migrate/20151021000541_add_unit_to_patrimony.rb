class AddUnitToPatrimony < ActiveRecord::Migration
  def change
    add_column :deal_patrimonies, :unit, :integer
    add_column :deal_patrimonies, :devolution_date, :date
    add_column :deal_patrimonies, :number, :string
    add_column :deal_patrimonies, :note_number, :string
    add_column :deal_patrimonies, :responsible, :string
  end
end
