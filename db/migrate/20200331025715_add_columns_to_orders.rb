class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :user_id, :integer
    add_column :orders, :name, :string
    add_column :orders, :postcode, :string
    add_column :orders, :address, :string
    add_column :orders, :payment, :string
    add_column :orders, :order_status, :string
    add_column :orders, :total_price, :integer
    add_column :orders, :postage, :integer
  end
end
