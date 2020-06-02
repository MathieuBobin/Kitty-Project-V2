# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rails.application.eager_load!
ApplicationRecord.descendants.each { |model|
  model.delete_all
  ActiveRecord::Base.connection.reset_pk_sequence!(model.table_name)
}

10.times do |i|
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testos",
    cart_id: -1
    
  )
  
end

10.times do |i|
  item = Item.create!(
    title: Faker::Creature::Cat.breed,
    description: Faker::Lorem.sentence(word_count: 50),
    price: rand(1..20),
    image_url: Faker::LoremFlickr.image(size: "286x180", search_terms: ['cats'])
    
  )
end

# Create cart for each user
User.all.each { |user|  
  Cart.create(user_id: user.id)
}

# Fill some carts
10.times do
  CartItem.create(cart_id: Faker::Number.within(range: 1..10), item_id: Faker::Number.within(range: 1..10))
end