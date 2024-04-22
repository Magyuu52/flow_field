# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
50.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = Faker::Internet.password(min_length: 6, max_length: 12)

  User.create(
    name: name,
    email: email,
    password: password,
    password_confirm: password
  )
end

50.times do |n|
  title = "sample-spot#{n + 1}"
  address = Faker::Address.full_address
  content = "これは#{n + 1}番目のスポットの投稿です。"
  user_id = Faker::Number.between(from: 1, to: 50)

  Post.create(
    title: title,
    address: address,
    content: content,
    user_id: user_id
  )
end
