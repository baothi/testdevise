class AddResetToAdmins < ActiveRecord::Migration
  def change
    add_column :admin_admins, :reset_digest, :string
    add_column :admin_admins, :reset_sent_at, :datetime
  end
end
