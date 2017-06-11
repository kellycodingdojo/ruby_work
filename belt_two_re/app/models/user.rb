class User < ActiveRecord::Base
  has_secure_password
  has_many :sales
  has_many :products
  has_many :transactions, :through => :products, :source => :sales
end


