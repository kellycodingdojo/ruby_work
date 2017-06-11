class MessagesController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	@messages = Message.all
  end

  def create
  	@message = Message.new(message_params)
  	@message.user_id = session[:user_id]
  	if @message.save
  		redirect_to "/messages"
  	else
  		flash[:errors] = @message.errors.full_messages
  		redirect_to :back
  	end
  end

  private 
  def message_params
  	params.require(:message).permit(:message)
  end
end
