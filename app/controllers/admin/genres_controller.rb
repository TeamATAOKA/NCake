class Admin::GenresController < ApplicationController

  before_action :admin_user
  def index
  	  @genres = Genre.all
  	  @genre = Genre.new
  end

  def edit
  	  @genre = Genre.find(params[:id])
  end

  def create
  	  @genre = Genre.new(genre_params)
  	  @genre.save
      redirect_to edit_admin_genre_path(@genre)
  end

  def update
  	  @genre = Genre.find(params[:id])
  	  @genre.update(genre_params)
  	  redirect_to admin_genres_path
  end

  private
    def genre_params
        params.require(:genre).permit(:genre_name, :genre_status)
    end

    def admin_user
      unless admin_signed_in?
        redirect_to root_path
      end
    end
end
