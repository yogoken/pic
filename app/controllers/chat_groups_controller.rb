class ChatGroupsController < ApplicationController
  before_action :set_chat_group, only: [:edit, :update]

  def index
    @chat_groups = current_user.chat_groups
  end

  def new
    @chat_group = ChatGroup.new
    @chat_group.users << current_user
  end

  def create
    @chat_group = ChatGroup.new(chat_group_params)
    if @chat_group.save
      redirect_to chat_group_messages_path(@chat_group), notice: 'チャットグループが作成されました。'
    else
      render :new
    end
  end

  private

  def set_chat_group
    @chat_group = ChatGroup.find(params[:id])
  end

  def chat_group_params
    params.require(:chat_group).permit(:name)
  end
end