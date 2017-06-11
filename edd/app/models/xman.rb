class Xman < ActiveRecord::Base
  validates :name, :power, presence: true
end
