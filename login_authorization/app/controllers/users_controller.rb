class UsersController < ApplicationController

	before_action :require_login, except: [:new, :create]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to @user
		else 
			flash[:errors] = @user.errors.full_messages
			redirect_to :back
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		session[:user_id] = nil
		redirect_to '/sessions/new'
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confrimation)
	end
end 
