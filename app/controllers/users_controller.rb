class UsersController < ApplicationController

  def show
      @user = current_user
  end

  def edit
      @user = User.find(params[:id])
  end

  def withdrawal
  end

  def hide
    @user = User.find(params[:id])
    #↓deleted_atカラムにフラグを立てる（デフォルトはfalse)
    @user.update(deleted_at: true)
    @user.update(user_status: '退会済')
    #↓ログアウトさせる
    reset_session
    redirect_to root_path
  end

  def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user)
  end

  private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :email, :address, :phone_number)
    end
end
