class OrdersController < ApplicationController

  before_action :ensure_correct_user, only:[:index, :show]
  def index
      @user = current_user
      @orders = @user.orders
  end

  def show
      @user = current_user
      @order = Order.find(params[:id])
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
                #住所登録用のsession[:post]を生成
                session[:post] = Post.new
                session[:post][:name] = params[:new_name]
                session[:post][:postcode] = params[:new_postcode]
                session[:post][:address] = params[:new_address]
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
      if order.save
        #住所を新規入力した場合、住所を保存する
        if session[:addresses].to_i == 3
          post = Post.new(session[:post])
          post.user_id = current_user.id
          post.save
        end
        #カートアイテムを注文商品に登録する
        current_user.cart_items.each do |cart_item|
          order_items = OrderItem.new
          order_items.sale_price = cart_item.item.price
          order_items.item_count = cart_item.item_count
          order_items.item_id = cart_item.item.id
          order_items.order_id = order.id
          order_items.save
        end

        #カートの中身を空にする
        User.find(current_user.id).cart_items.destroy_all
      end
  end

  private

  def ensure_correct_user
      if user_signed_in?
        user = User.find(params[:id])
        if current_user.id !=  user.id
          redirect_to root_path
        end
      end
  end
end
