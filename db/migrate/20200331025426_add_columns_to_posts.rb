class AddColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :name, :string
    add_column :posts, :postcode, :string
    add_column :posts, :address, :string
  end
end
