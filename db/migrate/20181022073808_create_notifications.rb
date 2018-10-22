class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :recipient
      t.datetime :sent_at
      t.timestamps
    end
  end
end
