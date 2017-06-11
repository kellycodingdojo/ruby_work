class Lender < ActiveRecord::Base
  has_secure_password
  has_many :historys
  validates :first_name, :last_name, :email, :money,  presence: true
  validates :password, presence: true, on: [:create]
end
