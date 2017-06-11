class User < ActiveRecord::Base
has_secure_password
  has_many :songs
  has_many :playlists
  has_many :songs_added, through: :playlists, source: :song
 

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  before_save :downcase_email

  private
  def downcase_email
    email.downcase! if email.present?
  end

end
