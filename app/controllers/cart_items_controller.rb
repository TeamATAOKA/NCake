class CartItemsController < ApplicationController
  def index
  	  @user = current_user
  	  @item = Item.find(params[:id])
  	  @cart_item = @user.cart_items
  end


  def create
      @cart_item = CartItem.new
      @cart_item.save
      redirect_to user_cart_items_path
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

  private
   def cart_item_params
    params.require(:cart_item).permit(:item_id, :user_id, :item_count)
  end

end
