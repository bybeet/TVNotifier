class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :username
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_secure_password

  #Many list_shows, destory the listshow for the user when user is destroyed.
  has_many :list_shows, dependent: :destory
end
