# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
USERS = [["monkey","banana"],["apple","bee"]]
POSTS = [["What happened to Kenny?", "The bastards killed Kenny!"],["What does Cartman say?","He said 'Screw you guys. I'm going home!"],["What does the fox say?", "Ding ding ding ding ding ding ding ding"]]

USERS.each do |user|
  User.create(username: user[0], password: user[1])
end

POSTS.each do |post|
  Post.create(title: post[0], content: post[1], user_id: (1..2).to_a.sample)
end
