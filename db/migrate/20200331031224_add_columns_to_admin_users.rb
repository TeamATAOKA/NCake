class AddColumnsToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :password, :string
    add_column :admin_users, :email, :string
  end
end
