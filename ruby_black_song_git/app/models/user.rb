class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :songs
  has_many :counts
  has_many :songs_counted, through: :counts, source: :song, dependent: :destroy
  validates :first_name,  presence:true
  validates :last_name,  presence:true
  
  validates :email, presence: true, uniqueness: true,format: {with: EMAIL_REGEX}
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, :presence => true
  validates :password,length: { minimum: 8 }
end
