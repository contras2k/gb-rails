class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :commentators, through: :comments, source: :user

  validates :title, presence: true
  validates :title, length: { maximum: 80, too_long: "Titles should be not so long" }
  validates :title, uniqueness: true
  validates :body, length: { maximum: 2000, too_long: "TL:DR" }

end
