class GroupSessionsController < ApplicationController
  def new
  end

  def create
    group = Group.find_by(name: "#{ group_session_params[:name] }", key: "#{ group_session_params[:key] }")
    if group
      current_user.update(group_id: group.id)
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = '正しいグループ名もしくはグループキーを入力してください'
      render :new
    end
  end
end
