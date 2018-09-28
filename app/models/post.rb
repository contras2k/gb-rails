class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :title, length: { maximum: 80, too_long: "Titles should be not so long" }
  validates :title, uniqueness: true
  validates :body, length: { maximum: 2000, too_long: "TL:DR" }

end
