class Work < ApplicationRecord
  belongs_to :user
  
  validates :title, length: { maximum: 50 }
  validates :image, presence: true
  validates :number_of_moves, presence: true, numericality: { only_integer: true, greater_than: 0, odd: true }
  validates :description, length: { maximum: 255 }
  validates :hint, length: { maximum: 255 }
  validates :explanation, length: { maximum: 255 }
  
  mount_uploader :image, ImagesUploader
end
