# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin
(11..30).each do |number|
  User.create(name: 'test name ' + number.to_s,
              email: 'test_email' + number.to_s + '@test.com',
              password: 'test_password' + number.to_s,
              biography: 'test biography' + number.to_s)
end
=end

=begin
shimo = User.find(6)
users = User.where("id > ?", 7)
users.each do |user|
  user.follow(shimo)
end
=end