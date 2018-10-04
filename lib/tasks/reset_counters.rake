##
#

namespace :db do
  desc 'Пересчитать счётчики'
  task reset_counters: :environment do
    User.find_each { |u| User.reset_counters(u.id, :comments) }
  end
end
