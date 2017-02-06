class List < ActiveRecord::Base
  validates :title, presence: true
  has_many :tasks
  belongs_to :user
end
