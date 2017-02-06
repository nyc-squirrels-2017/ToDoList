class User < ActiveRecord::Base
    has_many :lists, dependent: :destroy
    has_many :tasks, dependent: :destroy

    validates :username, :email, uniqueness: true
    validates :username, :email, presence: true
    validates :password, length: { minimum: 6 }
    
    has_secure_password
end
