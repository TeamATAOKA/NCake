class HomeController < ApplicationController
  def top
  	  @genres = Genre.all
  	  @items = Item.all
  end

  def about
  end

  def thanks
  end
end
