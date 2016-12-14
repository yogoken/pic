class Admin::UsersController < AdminController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      redirect_to new_admin_user_path
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(
      :id,
      :email,
      :nickname,
      :avatar,
      :password,
      :admin
    )
  end

end
