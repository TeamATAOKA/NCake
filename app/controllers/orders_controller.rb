class OrdersController < ApplicationController

  def index
      @orders = Order.all
  end

  def show
  end

  def new
      @order = Order.new
      @user = current_user
      @posts = @user.posts
  end

  def create
      session[:order] = Order.new
      session[:payments] = params[:payment_option]
      session[:addresses] = params[:address_option]
      session[:order][:user_id] = current_user
        if session[:payments].to_i == 1
         session[:order][:payment] = "クレジットカード"
        elsif session[:payments].to_i == 2
            session[:order][:payment] = "銀行振込"
        end

        if session[:addresses].to_i == 1
           session[:order][:name] = current_user.name
           session[:order][:postcode] = current_user.postcode
           session[:order][:address] = current_user.address

        elsif   session[:addresses].to_i == 2
                post = Post.find(params[:id])
                session[:order][:name] = post.name
                session[:order][:postcode] = post.postcode
                session[:order][:address] =  post.address

        elsif   session[:addresses].to_i == 3
                session[:order][:name] = params[:new_name]
                session[:order][:postcode] = params[:new_postcode]
                session[:order][:address] = params[:new_address]
        end
      redirect_to confirm_orders_path
  end

  def confirm
      @user = current_user
      @cart_item = @user.cart_items
      session[:order][:postage] = 800
  end

  def update
      @order = Order.find(params[:id])
      @order.update
  end

  def done
      order = Order.new(session[:order])
      order.user_id = current_user.id
      order.save
  end


end
