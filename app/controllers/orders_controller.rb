class OrdersController < ApplicationController
  def index
      @orders = Order.all
  end

  def show
      @order = Order.find(params[:id])
  end

  def new
      @order = Order.new
  end

  def create
      @order = Order.build(order_params)
      respond_to do |format|
        if @order.save
           format.html (redirect_to home_thanks_path)
        else
           format.html (render action: 'new')
        end
      end
  end

  def update
      @order = Order.find(params[:id])
      @order.update
  end
end
