class AddBuyDateToPatrimony < ActiveRecord::Migration
  def change
    add_column :deal_patrimonies, :buy_date, :date
  end
end
