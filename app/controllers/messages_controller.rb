class MessagesController < ApplicationController
  def index
    @message  = Message.new
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    @messages = Message.all
    if @message.save
      redirect_to messages_path, notice: 'return message successfully'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
