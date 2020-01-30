class Move < ApplicationRecord
  belongs_to :work
  
  validates :number_of_move, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :column, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 9 }
  validates :row, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 9 }
  validates :piece, presence: true
end
