class CreateWorkStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :work_statuses do |t|
      t.references :user, foreign_key: true, null: false
      t.references :work, foreign_key: true, null: false
      t.integer :status, null: false

      t.timestamps
      
      t.index [:user_id, :work_id], unique: true
    end
  end
end
