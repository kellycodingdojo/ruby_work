require 'rails_helper'

feature "user registers or logs in" do
	before(:each) do
		visit "/login"
	end

	scenario "login/registration is succesfull" do
		fill_in "user[username]", with: "lukeskywalker"
		click_button "Create User"
		expect(page).to have_current_path("/messages")
		expect(page).to have_content("Welcome, lukeskywalker")
	end

	scenario "login fails because username is empty" do
		click_button "Create User"
		expect(page).to have_current_path("/login")
		expect(page).to have_content("Username can't be blank")
	end

	scenario "login fails because username is not 5 characters" do
		fill_in "user[username]", with: "bill"
		click_button "Create User"
		expect(page).to have_current_path("/login")
		expect(page).to have_content("Username is too short (minimum is 5 characters)")
	end

end