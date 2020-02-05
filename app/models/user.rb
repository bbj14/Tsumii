class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :biography, length: { maximum: 255 }
  has_secure_password
  acts_as_paranoid
  
  mount_uploader :image, ImagesUploader
  
  has_many :works, dependent: :destroy
  
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverses_of_relationship, source: :user
  
  has_many :likes, dependent: :destroy
  has_many :liked_works, through: :likes, source: :work
  
  has_many :work_statuses, dependent: :destroy
  
  has_many :comments, dependent: :destroy
  
  #relationships
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy! if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  #likes
  def like(work)
    self.likes.find_or_create_by(work_id: work.id)
  end
  
  def unlike(work)
    like = self.likes.find_by(work_id: work.id)
    like.destroy! if like
  end
  
  def like?(work)
    self.liked_works.include?(work)
  end
  
  #timeline
  def feed_works
    Work.where(user_id: self.following_ids + [self.id])
  end
  
  #statuses
  def create_status(work, status)
    self.work_statuses.find_or_create_by(work_id: work.id, status: status)
  end
  
  def change_status(work, status)
    self.work_statuses.find_by(work_id: work.id).update!(status: status)
  end
  
  def delete_status(work)
    self.work_statuses.find_by(work_id: work.id).destroy!
  end
  
  def solved_works
    Work.joins(:work_statuses).includes(:work_statuses).where(work_statuses: { status: "solved", user_id: self.id }).merge(WorkStatus.order(updated_at: :desc))
  end
  
  def solve_later_works
    Work.joins(:work_statuses).includes(:work_statuses).where(work_statuses: { status: "solve_later", user_id: self.id }).merge(WorkStatus.order(updated_at: :desc))
  end
  
end
