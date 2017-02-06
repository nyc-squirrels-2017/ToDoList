class Task < ActiveRecord::Base
    belongs_to :list, dependent: :destroy
    belongs_to :user, dependent: :destroy
    
    validates :name, :due_date, :user_id, :list_id, presence: true
end