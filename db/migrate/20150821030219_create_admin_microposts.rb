class CreateAdminMicroposts < ActiveRecord::Migration
  def change
    create_table :admin_microposts do |t|
      t.text :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
