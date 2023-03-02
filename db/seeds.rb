require 'faker'
puts "🌱 Seeding ..."

# Create 10 blogs
10.times do
  Blog.create(
    title: Faker::Lorem.sentence(word_count: 3),
    body: Faker::Lorem.paragraph(sentence_count: 5),
    author: Faker::Name.name,
    image: Faker::Internet.url(host: 'lorempixel.com', path: '600/400/technics')
  )
end

# Create 20 readers
20.times do
  Reader.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end

# Create 50 reviews
50.times do
  Review.create(
    rating: rand(1..5),
    comment: Faker::Lorem.paragraph(sentence_count: 3),
    blog_id: rand(1..10),
    reader_id: rand(1..20)
  )
end



puts "✅ Done seeding!"