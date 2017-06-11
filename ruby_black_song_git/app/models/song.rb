class Song < ApplicationRecord
  belongs_to :user
  has_many :counts,dependent: :destroy
  has_many :users, through: :counts,dependent: :destroy
  validates :artist,  presence:true
  validates :title,  presence:true
  validates :artist,  length: { minimum: 2 }
  validates :title,  length: { minimum: 2 }
end
