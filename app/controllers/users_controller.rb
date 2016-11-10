class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: :index

  def index
    @users = User.all
  end

  def show
    @letters = @user.user_letters
  end

  def edit
    if current_user != @user
      redirect_to root_path
    end
  end

  def update
    if current_user == @user
      if @user.update(update_params)
        flash[:notice] = "ユーザー情報の編集に成功しました。"
      else
        flash[:alert] = "ユーザー情報の編集に失敗しました。"
      end
      redirect_to :back
    else
      redirect_to root_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:nickname, :avatar)
  end
end
