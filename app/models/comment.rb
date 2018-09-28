class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true
  validates :body, length: { maximum: 1000, too_long: "Too long comment" }

end
