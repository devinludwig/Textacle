class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(body: message_params[:body], to: message_params[:to], from: message_params[:from])
    binding.pry
    if current_user.messages.push(@message)
      flash[:notice] = "Your message was sent!"
      redirect_to user_messages_path
    else
      render 'new'
    end
  end

  def index
    @messages = Message.all
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
