class AddRememberDigestToAdminAdmins < ActiveRecord::Migration
  def change
    add_column :admin_admins, :remember_digest, :string
  end
end
