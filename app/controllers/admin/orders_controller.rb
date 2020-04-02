class Admin::OrdersController < ApplicationController
  def index
  	  @orders = Order.all
  end

  def show
  	  @user = @order.user
  	  @order = Order.find(params[:id])
  end

  def update
  	  @order = Order.find(params[:id])
  	  @order.update(order_params)
  	  redirect_to user_path(@user)
  end
end
