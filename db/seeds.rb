Snake.names.each do |name|
  Breed.create(name: name.downcase)
  puts "#{name} created"
end