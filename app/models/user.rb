class User < ActiveRecord::Base
  has_many :lists
  has_many :tasks, through: :list, source: :task

  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: {minimum: 6}
  has_secure_password

end
