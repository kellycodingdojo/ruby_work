require 'rails_helper'

feature "logout functionality works" do
	
	before(:each) do 
		visit "/login"
		fill_in "user[username]", with: "lukeskywalker"
		click_button "Create User"
	end

	scenario "there is a logout button" do
		expect(page).to have_link("Logout")
	end

	scenario "logout is succesfull" do
		click_link "Logout"
		expect(page).to have_current_path("/login")
	end
end