class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  validates :user_id, presence: true
end
