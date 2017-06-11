class Borrower < ActiveRecord::Base
	belongs_to :lender
	has_many :historys
	has_many :lenders, through: :historys
	has_many :lenders_raised, through: :historys, source: :lender
  has_secure_password
end


  # belongs_to :user
  # has_many :joins
  # has_many :users, through: :joins
  # has_many :users_joined, through: :joins, source: :user