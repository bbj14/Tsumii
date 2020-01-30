class CreateMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :moves do |t|
      t.references :work, foreign_key: true, null: false
      t.integer :number_of_move, null: false
      t.integer :column, null: false
      t.integer :row, null: false
      t.string :piece, null: false
      t.string :state

      t.timestamps
      
      t.index [:work_id, :number_of_move], unique: true
    end
  end
end
