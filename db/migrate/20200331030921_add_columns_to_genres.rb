class AddColumnsToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :genre_name, :string
    add_column :genres, :genre_status, :string
  end
end
