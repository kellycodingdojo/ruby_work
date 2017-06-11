class RpgController < ApplicationController
	Time.zone = "Pacific Time (US & Canada)"
	def index
		unless session[:gold]
			session[:gold] = 0
		end
		unless session[:activities]
			session[:activities] = []
		end
		@gold = session[:gold]
		@activities = session[:activities]
	end

	def gold

		if params[:building] == 'farm'
			new_gold = rand(10..20)
		elsif params[:building] == 'cave'
			new_gold = rand(5..10)
		elsif params[:building] == 'house'
			new_gold = rand(2..5)
		elsif params[:building] == 'casino'
			new_gold = rand(-50..50)
		end

		session[:gold] += new_gold

		if new_gold > 0
			session[:activities] << "Congratulations! You earned #{new_gold} gold! #{Time.zone.now.strftime("%b. %d, %Y %I:%M %p")}"
		else
			session[:activities] << "Sorry. You lost #{new_gold} gold! #{Time.zone.now.strftime("%b. %d, %Y %I:%M %p")}"
		end

		redirect_to :root
	end

	def reset
		reset_session
		redirect_to :root
	end
end
