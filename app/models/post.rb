class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :commentators, through: :comments, source: :user

  validates :title, presence: true
  validates :title, length: { maximum: 80, too_long: "Titles should be not so long" }
  validates :title, uniqueness: true
  validates :body, length: { maximum: 2000, too_long: "TL:DR" }

  # Задание №1 урока 4. Классовый метод, возвращающий список всех постов, написанных
  # пользователями со статусов модератор. Проверка показа корректность генерации SQL:
  # irb(main):035:0> y Post.from_moderators.pluck(:title)
  # (1.2ms)  SELECT "posts"."title" FROM "posts"
  #          INNER JOIN "users" ON "users"."id" = "posts"."user_id"
  #          WHERE "users"."moderator" = $1  [["moderator", true]]
  def self.from_moderators
    joins(:user).where(users: { moderator: true })
  end
end
