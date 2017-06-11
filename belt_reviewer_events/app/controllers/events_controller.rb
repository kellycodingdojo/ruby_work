class EventsController < ApplicationController
	
	 def create_event
  	event = Event.new(event_params)
  	event.user_id = session[:user_id]
  	if event.save
  		redirect_to :dash
  	else
  		flash[:errors] = "must be a future date."
	  	redirect_to :back
		end
	end

	def show
  	@event = Event.find(params[:id])
  	@comment = Comment.where(event_id: params[:id])
  	render :events
  end
	


	def join
	  join = Join.new(event_id: params[:id], user_id: session[:user_id] )
	  @event = Event.find(params[:id])
	   if join.save
	    redirect_to :dash
    else
  		flash[:errors] = event.errors.full_messages
	  	redirect_to :back
		end
  end

  def destroy_join
    @event = Event.find(params[:id])
    if @event.users_joined.include?(current_user)
      @join = Join.where(user_id: current_user.id, event_id: params[:id]).first
      # WE USE .FIRST because when we use where we return an array. so if we tried to use .destroy 
        #it would try to destroy the array instead of the user or val in the array.
      @join.destroy
      redirect_to "/dash"
    else
      flash[:errors] = @join.errors.full_messages
      redirect_to "/dash"
    end
  end


def comment
  	@comment = Comment.new(comment_params)
  	@comment.user_id = session[:user_id]
  	if @comment.save
  		redirect_to "/events/#{params[:comment][:event_id]}"
      # redirect_to "/event/#{@comment.event_id}"
  	else
  		flash[:errors] = comment.errors.full_messages
	  	redirect_to :back
		end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy if current_user === @event.user
    redirect_to :back
  end


		private
  def event_params
  	params.require(:event).permit(:name, :date, :location, :state)
  end

  def comment_params
  	params.require(:comment).permit(:comment, :event_id )
  end
 

end

  # def join_params  < 
  #   params.require(:join)permit(:user_id).merge(user: current_user)
  # end
  # !!!!cannot use this because you can only use the private method for form data. 

# rails g model Event 
# name:string 
# location:string 
# date:date 
# user:references 
# state:string 