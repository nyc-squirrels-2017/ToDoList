class List < ActiveRecord::Base
    belongs_to :user, dependent: :destroy
    has_many :tasks, dependent: :destroy 
    
    validates :name, :user_id, presence: true
end
