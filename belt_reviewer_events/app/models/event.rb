class Event < ActiveRecord::Base

  belongs_to :user
  has_many :joins
  has_many :users, through: :joins
  has_many :n, through: :joins, source: :user

validates :name, :presence => true
  validates :date, :presence => true
  validates :location, :presence => true
  validates :date, inclusion: { in: (Date.today..Date.today + 10.years) }

end
