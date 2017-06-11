require 'rails_helper'

RSpec.describe User, type: :model do
	
  context "user being created is valid" do
  	it 'saves correctly' do
	  	expect(build(:user)).to be_valid
  	end
  end

  context "user being created is invalid" do
  	it "doesn't save if username is blank" do
  		expect(build(:user, username:"")).to be_invalid
  	end

  	it "doesn't save if username is not unique" do
  		create(:user)
  		expect(build(:user)).to be_invalid
  	end

  	it "doesn't save if username is less than 5 characters" do
  		expect(build(:user, username: "hi")).to be_invalid
  	end
  end
end
