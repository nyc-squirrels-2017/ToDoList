class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :username, :email, presence: true

  has_secure_password

end
