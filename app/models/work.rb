class Work < ApplicationRecord
  belongs_to :user
  has_many :moves, inverse_of: :work, dependent: :destroy
  accepts_nested_attributes_for :moves, allow_destroy: true
  
  validates :title, length: { maximum: 50 }
  validates :image, presence: true
  validates :number_of_moves, presence: true, numericality: { only_integer: true, greater_than: 0, odd: true }
  validates :description, length: { maximum: 255 }
  validates :hint, length: { maximum: 255 }
  validates :explanation, length: { maximum: 255 }
  
  mount_uploader :image, ImagesUploader
  
  has_many :likes, dependent: :destroy
  has_many :users_liked_by, through: :likes, source: :user
  
  has_many :work_statuses, dependent: :destroy
  
  def self.order_by_likes
    Work.find(Like.group(:work_id).order('count(work_id) desc').pluck(:work_id))
  end
  
  def status(user)
    self.work_statuses.find_by(user_id: user.id)&.status
  end
end
