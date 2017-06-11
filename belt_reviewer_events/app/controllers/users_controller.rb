class UsersController < ApplicationController

	before_action :require_login, except: [:login, :register, :index]
	before_action :require_correct_user, only: [ :update, :show]

	def register 
			@user = User.new user_params
			if @user.save
				session[:user_id] = @user.id
				redirect_to :dash
			else 
				flash[:errors] = @user.errors.full_messages, "Problem with registering.."
				redirect_to :back
			end
	end
	
	def login 
		@user = User.find(params[:id]) 	
	end

	def index
		render :index
	end

	def show
		@user = User.find(params[:id])

		render :user
	end

	def update
		@user = User.find(params[:id])
	    if @user.update user_params
	      redirect_to "/dash"
	    else
	      flash[:errors] = @user.errors.full_messages
	      redirect_to "/dash"
	    end
	end

	def dash
		@all_users = User.all
		@jejejejejeje = Join.all
		@user = User.find(current_user.id)
		@events = Event.where.not(state: @user.state)
		@local_events = Event.where(state: @user.state)
		# So we are comparing the state column of the Event table to 
			# the users instance that we created above's state. 
				#The : next to state is acting as an =
		render :dash
	end

	private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :location, :state)
  end




end
