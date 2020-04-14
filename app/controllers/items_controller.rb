class ItemsController < ApplicationController
  def index
  	  @items = Item.page(params[:page]).reverse_order.per(5)
  	  @genres = Genre.all
  end

  def show
  	  @item = Item.find(params[:id])
  	  @genres = Genre.all
  	  @cart_item = CartItem.new
  	  @user = current_user
  end
end
