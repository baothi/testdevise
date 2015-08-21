class AddPasswordDigestToAdmins < ActiveRecord::Migration
  def change
    add_column :admin_admins, :password_digest, :string
  end
end
