# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User::Base.create(name: "yuji", email: "yuji@gmail.com", password: "1234567890")

20.times do |index|
  User::Base.create(name: "Name#{index}", email: "yuji#{index}@gmail.com", password: "password#{index}")
end

20.times do |i|
  User::Base.first.articles.create(title: "Hello World #{i}", content: "Hello New World #{i}", description: "Lets Rock The World #{i}")
end
