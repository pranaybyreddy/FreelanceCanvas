class Like < ApplicationRecord
  # Created by Yi Implemented by Yi 
  belongs_to :post
  belongs_to :user
  validates :post_id, presence: true
  validates :user_id, presence: true


end
