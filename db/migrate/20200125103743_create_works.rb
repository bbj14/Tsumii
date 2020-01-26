class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :image
      t.integer :number_of_moves
      t.string :description
      t.string :hint
      t.string :explanation

      t.timestamps
    end
  end
end
