class AddActivationToAdmins < ActiveRecord::Migration
  def change
    add_column :admin_admins, :activation_digest, :string
    add_column :admin_admins, :activated, :boolean, default: false
    add_column :admin_admins, :activated_at, :datetime
  end
end
