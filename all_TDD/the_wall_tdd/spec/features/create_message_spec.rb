require 'rails_helper'

feature "creating a new message" do
	before(:each) do
		visit "/login"
		fill_in "user[username]", with: "lukeskywalker"
		click_button "Create User"
	end
	scenario "message was created succesfully" do
		fill_in "message[message]", with: "This is a super long message yeah yeah yeah"
		click_button "Post Message"
		expect(page).to have_current_path("/messages")
		expect(page).to have_content("This is a super long message yeah yeah yeah")
	end

	scenario "message was empty" do
		click_button "Post Message"
		expect(page).to have_current_path("/messages")
		expect(page).to have_content("Message can't be blank")
	end

	scenario "message to be at least 10 characters" do
		fill_in "message[message]", with: "short"
		click_button "Post Message"
		expect(page).to have_current_path("/messages")
		expect(page).to have_content("Message is too short (minimum is 10 characters)")
	end
end