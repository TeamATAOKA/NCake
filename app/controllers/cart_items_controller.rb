class CartItemsController < ApplicationController
  def index
  	  @user = current.user
  	  @item = Item.find(params[:item_id])
  	  @cart_items = @user.cart_items
  end


  def create
      @cart_item = CartItem.new(params[:id])
      @cart_item.save
      redirect_to user_cart_items_path(@cart_item)
  end

  def update
  	  @cart_item = CartItem.find(params[:id])
  	  @cart_item.update
  	  redirect_back(fallback_location: root_path)
  end

  def destroy
  	  @item = Item.find(params[:item_id])
      @item.destroy
      redirect_back(fallback_location: root_path)
  end
end
