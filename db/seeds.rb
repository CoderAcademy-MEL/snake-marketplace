Snake.names.each do |name|
  Breed.create(name: name.downcase)
  puts "#{name} created"
end

snakes = [
  {
    title: "conbra kai",
    description: "really scary snake",
    breed_id: 29
  },
  {
    title: "toby",
    description: "an awesome boy",
    breed_id: 117
  },
  {
    title: "glen",
    description: "a beautiful boy",
    breed_id: 50
  },
  {
    title: "jake",
    description: "my name rhymes ",
    breed_id: 16
  }
]

snakes.each do |snake|
  random_num = rand(1..3)
  listing = Listing.create(snake)
  listing.picture.attach(
    io: File.open("app/assets/images/snake-#{random_num}.jpg"), 
    filename: "snake-#{random_num}.jpg", 
    content_type: "image/jpg"
  )
end 