class UsersController < ApplicationController
	def index
		render "/user"
	end

	def lend
		@user = Lender.find(params[:id])
		@bums = Borrower.all
		render "/lend"	
	end

	def borrow
		@user = Borrower.find(params[:id])
		@bums = Lender.all
		render "/borrow"
	end

	def lend_money
		
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

  def lending_params
  	params.require (:lending).permit(:money)
  end

   def borrow_params
  	params.require(:borrow).permit(:first_name, :last_name, :email, :password, :need, :description, :money)
  end
end
