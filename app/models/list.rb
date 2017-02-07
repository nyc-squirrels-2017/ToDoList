class List < ActiveRecord::Base
    belongs_to :user
    has_many :tasks, dependent: :destroy

    validates :name, :user_id, presence: true

    def complete?
      self.tasks.reject { |t| t.complete } ? false : true
    end
end
