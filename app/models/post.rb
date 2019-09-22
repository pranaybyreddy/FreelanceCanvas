class Post < ApplicationRecord
  # Created by Yi Implemented by Yi 
  has_attached_file :image, styles: {large: "1000x600#", medium: "500x300#", small: "100x100#"}, default_url: "/images/:style/missingPost.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_presence_of :image_file_size
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :passive_like, class_name: "Like", foreign_key: "post_id", dependent: :destroy
  has_many :likes, through: :passive_like, source: :user



end
