class BorrowersController < ApplicationController
	def create
		@borrower = Borrower.new(borrower_params)
		@borrower.raised = 0
		if @borrower.save
			session[:user_id] = @borrower.id
			session[:type] = "borrower"
			redirect_to @borrower
		else
			flash[:errors] = @borrower.errors.full_messages
			redirect_to :back
		end
	end

	def show
		@borrower = Borrower.find(params[:id])
		@transactions = History.includes(:lender).where(borrower_id: session[:user_id])
	end

	private
	def borrower_params
		params.require(:borrower).permit(:first_name, :last_name, :email, :password, :password_confirmation, :money, :purpose, :description)
	end
end
