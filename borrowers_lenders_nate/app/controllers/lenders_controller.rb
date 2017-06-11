class LendersController < ApplicationController

	def show
		@lender = Lender.find(params[:id])
		@borrowers = Borrower.all
		@transactions = History.includes(:borrower).where(lender_id: session[:user_id])
	end

	def create
		@lender = Lender.new(lender_params)
		if @lender.save
			session[:user_id] = @lender.id
			session[:type] = "lender"
			redirect_to @lender
		else
			flash[:errors] = @lender.errors.full_messages
			redirect_to :back
		end
	end

	def transaction
		@lender = Lender.find(session[:user_id])
		if @lender.money < params[:amount].to_i
			flash[:errors] = ["You have insufficient funds"]
			redirect_to :back
		else
			@borrower = Borrower.find(params[:id])
			if History.exists?(lender_id: session[:user_id], borrower_id: params[:id])
				if @borrower.money - @borrower.raised < params[:amount].to_i
					flash[:errors] = ["You cannot lend more than the borrower needs"]
					redirect_to :back
				else
					history = History.where(lender_id: session[:user_id], borrower_id: params[:id]).first
					history.amount += params[:amount].to_i
					if history.save
						@lender.money -= params[:amount].to_i
						@lender.save
						@borrower.raised += params[:amount].to_i
						@borrower.save
						redirect_to "/lenders/#{session[:user_id]}"
					end
				end
			else
				if @borrower.money - @borrower.raised < params[:amount].to_i
					flash[:errors] = ["You cannot lend more than the borrower needs"]
					redirect_to :back
				else
					history = History.new(lender_id: session[:user_id], borrower_id: params[:id], amount: params[:amount])
					if history.save
						@lender.money -= params[:amount].to_i
						@lender.save
						@borrower.raised += params[:amount].to_i
						@borrower.save
						redirect_to "/lenders/#{session[:user_id]}"
					else
						flash[:errors] = history.errors.full_messages
						redirect_to :back
					end
				end
			end
		end
	end

	private
	def lender_params
		params.require(:lender).permit(:first_name, :last_name, :email, :password, :password_confirmation, :money)
	end
end
