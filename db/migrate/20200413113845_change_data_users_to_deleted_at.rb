class ChangeDataUsersToDeletedAt < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :deleted_at, :boolean
  end
end
