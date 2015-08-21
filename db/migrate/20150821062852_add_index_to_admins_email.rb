class AddIndexToAdminsEmail < ActiveRecord::Migration
  def change
  	add_index :admin_admins, :email, unique: true
  end
end
