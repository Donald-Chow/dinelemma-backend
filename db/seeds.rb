# Clearning Database
puts 'Destroying Votes'
Vote.destroy_all

puts 'Destroying VoteSession'
VoteSession.destroy_all

puts 'Destroying Restaurants'
Restaurant.destroy_all

puts 'Destroying Lists'
RestaurantList.destroy_all

puts 'Destroying groups'
Group.destroy_all

puts 'Destroying Users'
User.destroy_all

# Creating test users
puts 'Creating Users'
User.create(email: 'bot@wagon.com', password: 'secret')
user = User.create(email: 'donald@wagon.com', password: 'secret')
User.create(email: 'wagon@wagon.com', password: 'secret')

puts "Created #{User.count} users"

# Creating Restaruants
puts 'Creating Restaurants'

# Restaurant.create(name: 'Land', category: 'Curry')
place = GooglePlaces.new('ChIJcdp2USKLGGARMp5ZLeGuHiE').create_restaurant
place.category = 'Curry'
place.save
# Restaurant.create(name: 'Shokumuso', category: 'Lamb')
place = GooglePlaces.new('ChIJQxwbfRiLGGAR46CPWeMuEZo').create_restaurant
place.category = 'Lamb'
place.save
# Restaurant.create(name: 'I-rottah', category: 'Pizza')
place = GooglePlaces.new('ChIJzw7SjhiLGGARWG-QYL3IX2M').create_restaurant
place.category = 'Pizza'
place.save
# Restaurant.create(name: 'Ramen Jiro Meguro', category: 'Ramen')
place = GooglePlaces.new('ChIJ25oIUCOLGGAR3TR7RnkNNwo').create_restaurant
place.category = 'Ramen'
place.save
# Restaurant.create(name: 'Mouko Tanmen Nakamoto Meguro', category: 'Ramen')
place = GooglePlaces.new('ChIJN76b4xuLGGARz1rlCklybZA').create_restaurant
place.category = 'Ramen'
place.save
# Restaurant.create(name: '目黒インドカレ-Madhuban', category: 'Indian')
place = GooglePlaces.new('ChIJ_XChihiLGGARxdyS0QaEyrw').create_restaurant
place.category = 'Indian'
place.save
# Restaurant.create(name: 'Regionale', category: 'Italian')
place = GooglePlaces.new('ChIJ183ZhE2LGGARN6o89vCb6LM').create_restaurant
place.category = 'Italian'
place.save
# Restaurant.create(name: 'Sukiya', category: 'Beef Don')
place = GooglePlaces.new('ChIJ527zCiOLGGARcV53lKzC7').create_restaurant
place.category = 'Beef Don'
place.save
# Restaurant.create(name: 'SKaisen Misakikō Meguro', category: 'Sushi')
place = GooglePlaces.new('ChIJGelJ0leLGGARdPs6rXOBr-k').create_restaurant
place.category = 'Sushi'
place.save
# Restaurant.create(name: 'Mos Burger', category: 'Burger')
place = GooglePlaces.new('ChIJZcnIDRmLGGARIyh98svQQmk').create_restaurant
place.category = 'Burger'
place.save
# Restaurant.create(name: 'Bangkok Oriental Thai Restaurant', category: 'Thai')
place = GooglePlaces.new('ChIJa3hf7hiLGGARTXqlL10yWm4').create_restaurant
place.category = 'Thai'
place.save
# Restaurant.create(name: 'Yousyu Syonin Meguro Honten', category: 'Chinese Ramen')
place = GooglePlaces.new('ChIJTyYrgCKLGGARDpcFX58rIfI').create_restaurant
place.category = 'Chinese Ramen'
place.save
# Restaurant.create(name: 'Go Bring Slider', category: 'Sliders')
place = GooglePlaces.new('ChIJuRc4ctSLGGARWqw3AzvYKdA').create_restaurant
place.category = 'Sliders'
place.save
# Restaurant.create(name: 'We Are The Farm', category: 'Salad')
place = GooglePlaces.new('ChIJI7xOI5uLGGARsQxge527OCc').create_restaurant
place.category = 'Salad'
place.save
# Restaurant.create(name: 'PIZZA CHECK', category: 'Pizza')
place = GooglePlaces.new('ChIJj6I9dduLGGARqnJY8DuZzU8').create_restaurant
place.category = 'Pizza'
place.save
# Restaurant.create(name: 'Kaduya', category: 'Ramen')
place = GooglePlaces.new('ChIJzeyBviGLGGAR8VtKm8vw3mw').create_restaurant
place.category = 'Ramen'
place.save
# Restaurant.create(name: 'Pizza Giardino Savoy', category: 'Pizza')
place = GooglePlaces.new('ChIJNRwvGyKLGGARKm95YxJaJ_4').create_restaurant
place.category = 'Pizza'
place.save
# Restaurant.create(name: 'Katsu Midori Meguro', category: 'Sushi')
place = GooglePlaces.new('ChIJNTg_sB6LGGARbJ1rHJ0URVA').create_restaurant
place.category = 'Sushi'
place.save
# Restaurant.create(name: 'Yakiniku Myeongdong', category: 'Korean')
place = GooglePlaces.new('ChIJeVdYSeuLGGARE_4St66cIGY').create_restaurant
place.category = 'Korean'
place.save
# Restaurant.create(name: 'Tonkatsu Taihou', category: 'Pork Cutlet')
place = GooglePlaces.new('ChIJ1R9meBiLGGARqsOXNfjiaog').create_restaurant
place.category = 'Pork Cutlet'
place.save
# Restaurant.create(name: 'Takemura', category: 'Ramen')
place = GooglePlaces.new('ChIJZwe9PAmLGGARsNSpSk5whpI').create_restaurant
place.category = 'Ramen'
place.save
# Restaurant.create(name: 'Kosuge', category: 'Soba')
place = GooglePlaces.new('ChIJIzYR9RiLGGARZsX8gloxfXE').create_restaurant
place.category = 'Soba'
place.save
# Restaurant.create(name: 'Wagaya', category: 'Korean')
place = GooglePlaces.new('ChIJ6X1jAyKLGGARQZVfqPYLPs0').create_restaurant
place.category = 'Korean'
place.save
# Restaurant.create(name: 'WAWICH', category: 'Vietnamese')
place = GooglePlaces.new('ChIJB7pjCWCLGGARbAB0zDoV5_E').create_restaurant
place.category = 'Vietnamese'
place.save
# Restaurant.create(name: 'Joint', category: 'Burger')
place = GooglePlaces.new('ChIJ6fXgF0yLGGARXxx5nW3g8HE').create_restaurant
place.category = 'Burger'
place.save

puts "Created #{Restaurant.count} restaurants"

# Creating List
puts 'Creating List'

list = RestaurantList.create(name: 'Le Wagon Restaurant List', user:)

puts "Created #{RestaurantList.count} list"

# Add Retaurant to list
puts 'Creating list bookmarks'

Restaurant.all.each do |restaurant|
  ListBookmark.create(restaurant:, restaurant_list: list)
end

puts "Created #{ListBookmark.count} list bookmarks"

# Creating a group
puts 'Creating group'

group = Group.create(name: "TA 1298")

puts "Created #{Group.count} Groups"

# Add Group has an admin
puts 'Creating group'

GroupMember.create(group:, user:, admin: true)

puts "Created #{GroupMember.where(admin: true).count} admin"

# Add add member to group
puts 'Creating group'

GroupMember.create(group:, user: User.last)

puts "Created #{group.group_members.count} group members for #{group.name}."
puts "Admin is #{group.group_members.find_by_admin(true).user.username}"
