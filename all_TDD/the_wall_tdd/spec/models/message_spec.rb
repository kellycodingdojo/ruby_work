require 'rails_helper'

RSpec.describe Message, type: :model do
  context "message is valid" do
  	it 'saves correctly' do
  		expect(build(:message)).to be_valid
  	end
  end

  context "message is invalid" do

  	it "message cannot be blank" do
  		expect(build(:message, message: "")).to be_invalid
  	end

  	it "message must be at least 10 characters" do
  		expect(build(:message, message: "hi")).to be_invalid
  	end

  	it "user field must not be blank" do
  		expect(build(:message, user: nil)).to be_invalid
  	end
  end
end
