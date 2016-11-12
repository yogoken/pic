class GroupsController < ApplicationController
  before_action :set_group, only: %i(show edit update destroy)

  def new
    if current_user.group_id
      redirect_to root_path, flash: { alert: 'すでにグループに参加しています' }
    else
      @group = Group.new
   end
 end

  def show
    @members = User.save_group_except_current_user(current_user).shuffle
  end

  def create
    @group = Group.new(group_params)
    if @group.whether_existing?(group_params[:key], group_params[:name]) && @group.valid?
      @group.save
      current_user.group_id = @group.id
      current_user.save(context: :set_group_id)
    else
      flash.now[:alert] = 'グループ名もしくはグループキーを変更してください'
      render :new
    end
  end

  def edit
    redirect_to root_path unless current_user.group == @group
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  def destroy
    if current_user.group_id == @group.id
      @group.destroy
      flash.now[:alert] = 'グループに参加する、もしくは新しいグループを作成してください'
      redirect_to new_group_path
    else
      render :show
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :key)
  end

  def set_group
    if Group.find_by_id(params[:id])
      @group = Group.find(params[:id])
    else
      redirect_to root_path
    end
  end
end
