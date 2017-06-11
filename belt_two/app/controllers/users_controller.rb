class UsersController < ApplicationController


	def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.new(user_params)
      if @user.save
        redirect_to "/dashboard/#{@user.id}"
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to "/users/main"
      end
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/main"
    end
  end

  def show
    @user = User.find(params[:id])
   
  end



private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end




end

