class Task < ApplicationRecord
  belongs_to :project
  belongs_to :assigned_to, class_name: "User", optional: true
  belongs_to :created_by, class_name: "User"
  has_many :comments
  validates :name, presence: true

  scope :order_by_priority, -> {
    order_by = ['CASE']
    PRIORITY_ORDERS.each_with_index do |priority, index|
      order_by << "WHEN tasks.priority='#{priority}' THEN #{index}"
    end
    order_by << 'END'
    order(order_by.join(' '))
  }
end
