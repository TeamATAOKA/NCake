class AddColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :genre_id, :integer
    add_column :items, :price, :integer
    add_column :items, :text, :text
    add_column :items, :name, :string
    add_column :items, :image, :string
    add_column :items, :sale_status, :string
  end
end
