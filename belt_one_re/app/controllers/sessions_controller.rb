class SessionsController < ApplicationController

    def login 				
  	if Lender.exists?(email: user_params[:email])
  	  @user = Lender.find_by_email(user_params[:email])
  	  puts @user, "------------------------------"
      if @user && @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        redirect_to "/lend/#{session[:user_id]}"
      else
        flash[:error] = "problem logging in please try again....."
        redirect_to :back
      end
    else Borrower.exists?(email: user_params[:email])
      @user = Borrower.find_by_email(user_params[:email])
      if @user && @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        redirect_to "/borrow/#{session[:user_id]}"
      else
        flash[:error] = "problem logging in please try again....."
        redirect_to :back
      end
    end
  end

	def destroy
		session[:user_id] = nil
		redirect_to "/"
	end


 private
  def user_params
  	params.require(:user).permit(:email, :password)
  end

end
