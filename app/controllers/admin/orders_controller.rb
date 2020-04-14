class Admin::OrdersController < ApplicationController
  def index
  	  @orders = Order.page(params[:page]).reverse_order.per(5)

  end

  def show
  	  @order = Order.find(params[:id])
      @user = @order.user
  end

  def update
  	  @order = Order.find(params[:id])
  	  @order.update(order_params)
  	  redirect_to admin_order_path(@order)
  end

  private
  def order_params
      params.require(:order).permit(:user_id, :name, :postcode, :address, :payment, :order_status, :total_price, :postage)
  end

end
