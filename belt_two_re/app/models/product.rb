class Product < ActiveRecord::Base
  belongs_to :user
  has_many :sales
 
  has_many :buyers, :through => :sales, :source => :user
end

