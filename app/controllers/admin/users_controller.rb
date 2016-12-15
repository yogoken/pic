class Admin::UsersController < AdminController

  def index
    @users = User.all
    p @users
  end

  def new
    @user = User.new
    p @user
  end

  def create
    @user = User.new(user_params)
    p @user
    if @user.save
      p 'userのセーブに成功した時'
      redirect_to admin_users_path
    else
      p 'userのセーブに失敗した時'
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
