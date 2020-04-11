class OrdersController < ApplicationController
  before_action :confirm_params, only: [:confirm]
  def index
      @orders = Order.all
  end

  def show
  end

  def new
      @order = Order.new
      @user = current_user
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

  def confirm
    @user = current_user
    @post = Post.new
  end

  def update
      @order = Order.find(params[:id])
      @order.update
  end
private
  def confirm_params
   @order = Order.new(params.require(:order).permit(:name, :user_id, :address, :payment, :postage))
  end
end
