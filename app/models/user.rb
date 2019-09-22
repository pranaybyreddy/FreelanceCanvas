# write the validation on 07/22/2019 by Zhengqi

# Created by Yi Implemented by Yi 
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true

  before_save { self.email = email.downcase } 
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  # Associations implemented by Yi 
  has_many :active_relationships, class_name:  "Relationship",
  foreign_key: "follower_id",
  dependent:   :destroy
  has_many :passive_relationships, class_name: "Relationship",
  foreign_key: "followed_id",
  dependent: :destroy
  
  has_attached_file :avatar, styles: { medium: "300x300!", small:"200x200!", thumb: "50x50!" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed

  has_many :posts, dependent: :destroy

  has_many :active_like, class_name: "Like", foreign_key: "user_id", dependent: :destroy
  has_many :likes, through: :active_like, source: :post
  
  has_many :comments, dependent: :destroy
  
  # Helper functions to implement Follow functionality
  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end

  # helpers for implementing like functionalities
  def like post
    likes << post
  end
   
  def unlike post
    likes.delete post
  end

  def like? post 
    likes.include? post
  end

end
