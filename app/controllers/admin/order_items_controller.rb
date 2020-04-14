class Admin::OrderItemsController < ApplicationController
	def update
		@order = Order.find(params[:id])
		@order_item = OrderItem.find(params[:id])
		@order_item.update(order_item_params)
		redirect_to admin_order_path(@order_item.order.id)
	end

    private
    def order_item_params
      params.require(:order_item).permit(:order_id, :item_id, :item_count, :sale_price, :production_status)
    end
end
