class Admin::GenresController < ApplicationController
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
  end

  def update
  	  @genre = Genre.find(params[:id])
  	  @genre.update(genre_params)
  	  redirct_to genres_path
  end
end
