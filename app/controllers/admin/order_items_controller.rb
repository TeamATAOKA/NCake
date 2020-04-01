class Admin::OrderItemsController < ApplicationController
	def update
		@order = Order.find(params[:id])
		@order_item = Order_item.find(params[:id])
		@order_item.update(order_item_params)
		redirect_to order_path(@order)
	end
end
