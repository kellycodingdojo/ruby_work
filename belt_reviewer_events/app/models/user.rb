class User < ActiveRecord::Base
	has_many :events, dependent: :destroy
	has_many :comments
	has_many :joins
	has_many :events_joined, through: :joins, source: :event
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :location, :presence => true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  before_save :downcase_email

  private
  def downcase_email
    email.downcase! if email.present?
  end



end
