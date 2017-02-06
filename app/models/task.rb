class Task < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :list

end
