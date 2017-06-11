class Borrower < ActiveRecord::Base
  has_secure_password
  has_many :historys
  validates :first_name, :last_name, :email, :money, :purpose, :description, presence: true
  validates :password, presence: true, on: [:create]
end
