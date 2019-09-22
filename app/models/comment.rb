class Comment < ApplicationRecord
belongs_to :post
belongs_to :user
validates :body, length: { maximum: 300 },    presence: true
end
