class Comment < ApplicationRecord
  belongs_to :task
  # TODO: Should not be optional
  belongs_to :user, optional: true
end
