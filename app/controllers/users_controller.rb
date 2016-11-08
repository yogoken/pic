class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: :index

  def index
    @users = User.all
  end

  def show
    @letters = Letter.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:avatar)
  end
end
