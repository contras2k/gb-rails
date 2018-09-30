class Comment < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true
  validates :body, length: { maximum: 1000, too_long: "Too long comment" }

end
