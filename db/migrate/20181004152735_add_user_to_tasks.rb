class AddUserToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :assigned_to, index: true
    add_foreign_key :tasks, :users, column: :assigned_to_id
    add_reference :tasks, :created_by, index: true
    add_foreign_key :tasks, :users, column: :created_by_id
  end
end
