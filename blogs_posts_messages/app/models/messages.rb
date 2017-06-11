class Message < ActiveRecord::Base
	belongs_to :posts
	validates :message, presence: true
end