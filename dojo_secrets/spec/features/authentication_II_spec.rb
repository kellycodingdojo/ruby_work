require 'rails_helper'
feature 'authentication II A' do
  before do
    @user = create(:user)
    log_in
  end
  feature "Redirecting users who are not logged in from key areas of the site" do
    scenario 'user logs out and trys to access user profile' do
      expect(current_path).to eq("/users/#{@user.id}")
      click_button 'Log Out'
      expect(current_path).to eq("/sessions/new")
      visit "/users/#{@user.id}"
      expect(current_path).to eq("/sessions/new")
    end
    scenario 'user logs out and trys to access secrets index' do
      expect(current_path).to eq("/users/#{@user.id}")
      visit "/secrets"
      visit "/users/#{@user.id}"
      click_button 'Log Out'
      expect(current_path).to eq("/sessions/new")
      visit "/secrets"
      expect(current_path).to eq("/sessions/new")
    end
  end
end
feature "Non-registered user trys to access user 1's profile" do
  scenario "Non-registered user trys to access user 1's profile" do
    visit "/users/1"
    expect(current_path).to eq("/sessions/new")
  end
  scenario "Non-registered user trys to access secrets index" do
    visit "/secrets"
    expect(current_path).to eq("/sessions/new")
  end
end
