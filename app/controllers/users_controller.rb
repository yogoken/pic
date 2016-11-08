class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: :index

  def index
    @users = User.all
  end

  def show
    @letters = @user.user_letters
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:avatar)
  end
end
