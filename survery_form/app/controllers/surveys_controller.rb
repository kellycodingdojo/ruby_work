class SurveysController < ApplicationController
    def index
        # Set session views to zero if it doesn't exist yet
        session[:views] ||= 0
    end 

    def process_survey
        # Increment the session views upon submission of the form          
        session[:views] = session[:views] + 1

        # Save the post data (params[:survey]) to session
        session[:result] = params[:survey]

        # Save success message to flash to show it once
        flash[:success] = "Thanks for submitting this form! You have submitted this form #{ session[:views] } time(s) now."
        
        # To prevent submission of form with page reload
        redirect_to '/surveys/result'
    end

    def result
        # Save the data to variable accessible in the views
        @result = session[:result]
    end
end