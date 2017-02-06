class User < ActiveRecord::Base
  validates :username, :email, presence: true
  validates :password, length: {minimum: 6}
  has_many :lists, dependent: :destroy
  has_many :tasks, through: :lists, dependent: :destroy

  has_secure_password
end
