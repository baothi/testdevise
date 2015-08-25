class AddAdminToAdmins < ActiveRecord::Migration
  def change
    add_column :admin_admins, :admin, :boolean, default: false
  end
end
