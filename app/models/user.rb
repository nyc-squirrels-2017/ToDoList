class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :username, presence: true
  validates :email, presence: true
  has_many :lists
  has_many :tasks, through: :lists



  has_secure_password
end
