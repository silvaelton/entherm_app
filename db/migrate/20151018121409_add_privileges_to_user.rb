class AddPrivilegesToUser < ActiveRecord::Migration
  def change
    add_reference :users, :privilege, array: true
  end
end
