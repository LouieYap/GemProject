class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :due_date
      t.string :status
      t.string :priority

      t.timestamps
    end
  end
end
