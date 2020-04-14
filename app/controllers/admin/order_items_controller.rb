class Admin::OrderItemsController < ApplicationController
	before_action :admin_user
	def update
		@order_item = OrderItem.find(params[:id])
		@order_item.update(order_item_params)
		redirect_to admin_order_path(@order_item.order.id)
	end

    private
    def order_item_params
      params.require(:order_item).permit(:order_id, :item_id, :item_count, :sale_price, :production_status)
    end

    def admin_user
      unless admin_signed_in?
        redirect_to root_path
      end
    end
end
