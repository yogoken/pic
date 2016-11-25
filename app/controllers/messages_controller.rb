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
      flash[:alert] = @message.errors.full_messages.join(',')
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
