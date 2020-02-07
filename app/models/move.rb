class Move < ApplicationRecord
  belongs_to :work
  
  attr_accessor :state1, :state2, :state3
  before_validation :set_state
  
  
  validates :number_of_move, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :column, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 9 }
  validates :row, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 9 }
  validates :piece, presence: true
  
  private
  
  def set_state
    self.state = state1 << state2 << state3
  end
end
