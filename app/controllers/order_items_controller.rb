class OrderItemsController < ApplicationController

  def create
      @order_item = OrderItem.new
  	  redirect_to confirm_path(@order_item.id)
  end

  def update
  end
end
