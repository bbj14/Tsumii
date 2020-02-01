class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :biography, length: { maximum: 255 }
  has_secure_password
  
  mount_uploader :image, ImagesUploader
  
  has_many :works, dependent: :destroy
  
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverses_of_relationship, source: :user
  
  has_many :likes, dependent: :destroy
  has_many :liked_works, through: :likes, source: :work
  
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
  
  def feed_works
    Work.where(user_id: self.following_ids + [self.id])
  end
end
