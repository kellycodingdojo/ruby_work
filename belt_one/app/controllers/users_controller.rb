class UsersController < ApplicationController

	def index
		render "/user"
	end

	def lend
		render "/lend"
	end

	def borrow
		render "/borrow"
	end

	def login_page
		render "/login"
	end

	def register_lend 
			@user = Lender.new lend_params
			if @user.save
				session[:user_id] = @user.id
				redirect_to "/lend/#{@user.id}"
			else 
				flash[:errors] = @user.errors.full_messages, "Problem with registering.."
				redirect_to :user
			end
	end

	def register_borrow
			@user = Borrower.new borrow_params
			if @user.save
				session[:user_id] = @user.id
				redirect_to "/borrow/#{@user.id}"
			else 
				flash[:errors] = @user.errors.full_messages, "Problem with registering.."
				redirect_to :user
			end
	end


private
  def lend_params
  	params.require(:lend).permit(:first_name, :last_name, :email, :password, :money)
  end

   def borrow_params
  	params.require(:borrow).permit(:first_name, :last_name, :email, :password, :need, :description, :money)
  end



end
