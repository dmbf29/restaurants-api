puts 'Destroying Comments'
Comment.destroy_all
puts 'Destroying Restaurants'
Restaurant.destroy_all
puts 'Destroying Users'
User.destroy_all

names = %w(doug trouni yann sylvain)
names.each do |name|
  User.create!(
    email: name + '@lewagon.org',
    password: '123123'
  )
end

User.find_each do |user|
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    user: user
  )
  5.times do
    Comment.create!(
      content: Faker::Restaurant.review,
      restaurant: restaurant,
      user: User.where.not(id: user).sample
    )
  end
end
