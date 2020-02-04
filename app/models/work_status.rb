class WorkStatus < ApplicationRecord
  enum status: { solved: 0, solve_later: 1 }
  
  belongs_to :user
  belongs_to :work
end
