class Sale < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :sellers, :through => :products, :source => :user
end
