class SessionsController < ApplicationController
  def new
  end

  def create
  	if Borrower.exists?(email: params[:user][:email])
  		@borrower = Borrower.find_by_email(params[:user][:email])
  		if @borrower.authenticate(params[:user][:password])
  			session[:user_id] = @borrower.id 
  			session[:user_type] = "borrower"
  			redirect_to @borrower
  		else
  			flash[:errors] = ["Password/Email combination incorrect. Please try again."]
        redirect_to :back
  		end
  	elsif Lender.exists?(email: params[:user][:email])
  		@lender = Lender.find_by_email(params[:user][:email])
  		if @lender.authenticate(params[:user][:password])
  			session[:user_id] = @lender.id 
  			session[:user_type] = "lender"
  			redirect_to @lender
  		else
  			flash[:errors] = ["Password/Email combination incorrect. Please try again."]
  			redirect_to :back
  		end
  	else
  		flash[:errors] = ["User does not exists. Please register."]
  		redirect_to :back
  	end
  end

  def register
  end

  def destroy
  	reset_session
  	redirect_to '/'
  end
end
