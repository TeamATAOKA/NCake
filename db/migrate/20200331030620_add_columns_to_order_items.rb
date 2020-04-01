class AddColumnsToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :order_id, :integer
    add_column :order_items, :item_id, :integer
    add_column :order_items, :item_count, :integer
    add_column :order_items, :sale_price, :integer
    add_column :order_items, :production_status, :string
  end
end
