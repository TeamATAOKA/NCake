class PostsController < ApplicationController

  def index
      @post = Post.new
      @user = current_user
      @posts = @user.posts
  end

  def edit
      @post = Post.find(params[:id])
      @user = current_user
  end

  def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      @post.save
      redirect_to user_posts_path(@post)
  end

  def update
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to user_posts_path(@post)
  end

  def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_back(fallback_location: root_path)
  end

  private
    def user_params
        params.require(:user).permit(:first_name, :last_name)
    end

    def post_params
        params.require(:post).permit(:user_id, :name, :postcode, :address)
    end

end
