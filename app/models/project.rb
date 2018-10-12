class Project < ApplicationRecord
  has_many :tasks, dependent: :nullify
  validates :name, presence: true
end
