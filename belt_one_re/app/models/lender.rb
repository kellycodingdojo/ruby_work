class Lender < ActiveRecord::Base
	has_many :historys
	has_many :borrowers
  has_secure_password
end
