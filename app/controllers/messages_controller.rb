class MessagesController < ApplicationController
  before_action :set_chat_group

  def index
    @message  = Message.new
    @messages = @chat_group.messages
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to chat_group_messages_path(@chat_group), notice: 'メッセージを送信しました。'
    else
      redirect_to chat_group_messages_path(@chat_group), notice: 'メッセージを送信することができませんでした。'
    end
  end

  private

  def set_chat_group
    @chat_group = ChatGroup.find(params[:chat_group_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
