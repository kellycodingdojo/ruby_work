class SessionsController < ApplicationController
 

  def dashboard
	@user = User.find(params[:id])
	@product = Product.all
	end

	def create #Log User in with authenticate -- generates flash messages errors
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to "/dashboard/#{@user.id}"
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to "/"
    end
  end

 def sell
 	redirect_to "/dashboard/#{@user.id}"
 end


end



