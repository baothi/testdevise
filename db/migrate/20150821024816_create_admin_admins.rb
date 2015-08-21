class CreateAdminAdmins < ActiveRecord::Migration
  def change
    create_table :admin_admins do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
