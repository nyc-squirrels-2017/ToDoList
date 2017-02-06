class Task < ActiveRecord::Base
    belongs_to :list
    belongs_to :user

    validates :name, :due_date, :user_id, :list_id, presence: true
end
