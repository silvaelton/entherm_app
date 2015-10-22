class AddUserToAlert < ActiveRecord::Migration
  def change
    add_reference :access_alerts, :user, index: true
  end
end
