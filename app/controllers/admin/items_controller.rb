class Admin::ItemsController < ApplicationController
  before_action :admin_user
  def index
      @items = Item.page(params[:page]).reverse_order.per(5)
  end

  def show
      @item = Item.find(params[:id])
  end

  def new
      @item = Item.new
      @genres = Genre.all
  end

  def create
      @item = Item.new(item_params)
      @item.save
      redirect_to admin_item_path(@item)
  end

  def edit
      @item = Item.find(params[:id])
      @genres = Genre.all
  end

  def update
      @item = Item.find(params[:id])
      @item.update(item_params)
      redirect_to admin_item_path(@item)
  end

  private
    def item_params
        params.require(:item).permit(:name, :sale_status, :image, :text, :price, :genre_id)
    end

    def admin_user
      unless admin_signed_in?
        redirect_to root_path
      end
    end
end
