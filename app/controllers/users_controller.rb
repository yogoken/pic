class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i(edit update)
  before_action :set_user, only: %i(show edit update)

  def index
    @users = User.all
  end

  def show
    @letters = @user.user_letters
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'ユーザー情報の編集に成功しました。'
    else
      redirect_to edit_user_path, alert: 'ユーザー情報の編集に失敗しました。'
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

  def user_params
    params.require(:user).permit(
      :nickname,
      :avatar
    )
  end
end
