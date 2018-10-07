# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Like.delete_all
Comment.delete_all
Post.delete_all
User.delete_all

hash_users = Array.new(10) do
  email = FFaker::Internet.safe_email
  {
    name: FFaker::Internet.user_name[0...16],
    email: email,
    password: email
  }
end
users = User.create! hash_users

users.first(7).each { |u| u.update creator: true }
users.first(2).each { |u| u.update moderator: true }

creators = User.where(creator: true)
hash_posts = Array.new(20) do
  {
    title: FFaker::HipsterIpsum.phrase.first(80),
    body: FFaker::HipsterIpsum.paragraphs,
    user: creators.sample,
    visible: (rand > 0.1)
  }
end
posts = Post.create! hash_posts

hash_commentaries = Array.new(200) do
  commentable = (rand(2) == 1 ? posts : users).sample
  {
    body: FFaker::HipsterIpsum.paragraphs(2),
    user: users.sample,
    commentable_id: commentable.id,
    commentable_type: commentable.class.to_s,
    visible: (rand > 0.1)
  }
end
Comment.create! hash_commentaries
