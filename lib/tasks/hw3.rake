namespace :hw3 do
  desc "Заполняет мусором базу по состоянию на урок №3."
  task prefill: :environment do
    Comment.delete_all
    Post.delete_all
    User.delete_all

# Сперва создаём 10 пользователей, у каждого из них от 1 до 10 постов
    10.times do
      name = [BetterLorem.w(1,true,true),BetterLorem.w(1,true,true)].join(" ")
      u = User.create name: name,
                   email: "#{name.downcase.split.join}@#{BetterLorem.w(1,true,true).downcase}."\
                          "#{BetterLorem.w(1,true,true).downcase[0..rand(1..2)]}",
                   moderator: (rand < 0.1),
                   creator: (rand < 0.1),
                   banned: (rand < 0.1)
      rand(1..10).times do
        Post.create title: BetterLorem.w(rand(1..10),true,true),
                    body: BetterLorem.p(rand(1..10),true),
                    user: u,
                    visible: (rand < 0.1)
      end
    end
# Теперь уже к каждому посту по несколько комментов
    Post.all.each do |p|
      rand(0..20).times do
        u = User.offset(rand(User.count)).first
        Comment.create body: BetterLorem.p(rand(1..10),true),
                user: u,
                post: p,
                visible: (rand < 0.1)
      end
    end
  end

end
