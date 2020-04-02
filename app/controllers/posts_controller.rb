class PostsController < ApplicationController
  def index
      @posts = Post.all
      @post = Post.new
  end

  def edit
      @post = Post.find(params[:id])
  end

  def create
      @post = Post.new(post_params)
      @post.save
      redirect_to posts_path
  end

  def update
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to post_path(@post)
  end

  def destroy
      @post = post(params[:id])
      @post.destroy
      redirect_back(fallback_location: root_path)
  end
end
