class SessionsController < ApplicationController


# def create #Log User in with authenticate -- generates flash messages errors
#     @user = User.find_by_email(params[:email])
#     if @user && @user.authenticate(params[:password])
#       session[:user_id] = @user.id
#       redirect_to "/users/#{@user.id}"
#     else
#       flash[:errors] = ["Invalid Combination"]
#       redirect_to "/sessions/new"
#     end
#   end

# user = User.where(email: params[:email]).first

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




	 #  def login 				
  # 	if Lender.exists?(email: params[:email])
  # 	  @user = Lender.find_by_email(params[:email])
  #     if @user && @user.authenticate(params[:password])
  #       session[:user_id] = @user.id
  #       redirect_to "/lend/#{session[:@user_id]}"
  #     else
  #       flash[:error] = "problem logging in please try again....."
  #       redirect_to "/login"
  #     end
  #   elsif Borrower.exists?(email: params[:email])
  #     @user = Borrower.find_by_email(params[:email])
  #     if @user && @user.authenticate(params[:password]).first
  #       session[:user_id] = @user.id
  #       redirect_to "/borrow/#{session[:@user_id]}"
  #     else
  #       flash[:error] = "problem logging in please try again....."
  #       redirect_to "/login"
  #     end
  #   end
  # end
	
 private
  def user_params
  	params.require(:user).permit(:email, :password)
  end



end

# 	def login 
# 		if @user = Lender.find_by_email(params[:user][:email])
# 			if @user && @user.authenticate(params[:user][:password])
# 				session[:user_id] = @user.id
# 				redirect_to "/lend/#{@user.id}"
# 				else
# 					flash[:errors] = "problem logging in please try again....."
# 					redirect_to :back
# 				end
# 			end
# 		end
# 		elsif  @user = Borrower.find_by_email(params[:user][:email])
# 			if @user && @user.authenticate(params[:user][:password])
# 				session[:user_id] = @user.id
# 				redirect_to "/borrow/#{@user.id}"
# 				else
# 					flash[:errors] = "problem logging in please try again....."
# 					redirect_to :back
# 				end
# 			end
# 		end
# 	end
# end

# def login 
# 		@user = User.find_by_email(params[:user][:email])
# 		if @user && @user.authenticate(params[:user][:password])
# 			session[:user_id] = @user.id
# 			redirect_to "/dash"
# 		else
# 			flash[:errors] = "problem logging in please try again....."
# 			redirect_to :back
# 		end
# 	end
#@join = Join.where(user_id: current_user.id, event_id: params[:id]).first
