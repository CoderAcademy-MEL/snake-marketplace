require_relative "data/listings"

puts "seeding breeds"

Snake.names.each do |name|
  Breed.create(name: name.downcase)
end

puts "successfully seeded breeds ✅"

puts "seeding listings"

snakes.each do |snake|
  random_num = rand(1..3)
  listing = Listing.create(snake)
  listing.picture.attach(
    io: File.open("app/assets/images/snake-#{random_num}.jpg"), 
    filename: "snake-#{random_num}.jpg", 
    content_type: "image/jpg"
  )
end 

puts "successfully seeded listings ✅"

puts "seed file done 🐍"