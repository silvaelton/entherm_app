class CreateAccessUserContracts < ActiveRecord::Migration
  def change
    create_table :access_user_contracts do |t|
      t.references  :user, index: true
      t.references  :contract, index: true
      t.timestamps null: false
    end
  end
end
