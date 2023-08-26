# Clearning Database
puts 'Destroying Restaurants'
Restaurant.destroy_all

puts 'Destroying Users'
User.destroy_all

puts 'Destroying Lists'
RestaurantList.destroy_all


# Creating test users
puts 'Creating Users'
user = User.create(email: 'donald@wagon.com', password: 'secret', username: 'Donald', name: 'Donald')
User.create(email: 'test@test.com', password: 'secret', username: 'test123', name: 'test')

puts "Created #{User.count} users"

# Creating Restaruants
puts 'Creating Restaurants'

Restaurant.create(name: 'Land', category: 'Curry')
Restaurant.create(name: 'Shokumuso', category: 'Lamb')
Restaurant.create(name: 'I-rottah', category: 'Pizza')
Restaurant.create(name: 'Ramen Jiro Meguro', category: 'Ramen')
Restaurant.create(name: 'Mouko Tanmen Nakamoto Meguro', category: 'Ramen')
Restaurant.create(name: '目黒インドカレ-Madhuban', category: 'Indian')
Restaurant.create(name: 'Issunboshi', category: 'Ramen')
Restaurant.create(name: 'Regionale', category: 'Italian')
Restaurant.create(name: 'Sukiya', category: 'Beef Don')
Restaurant.create(name: 'Shapla India', category: 'Indian')
Restaurant.create(name: 'SKaisen Misakikō Meguro', category: 'Sushi')
Restaurant.create(name: 'Mos Burger', category: 'Burger')
Restaurant.create(name: 'Bangkok Oriental Thai Restaurant', category: 'Thai')
Restaurant.create(name: 'Yousyu Syonin Meguro Honten', category: 'Chinese Ramen')
Restaurant.create(name: 'Go Bring Slider', category: 'Sliders')
Restaurant.create(name: 'We Are The Farm', category: 'Salad')
Restaurant.create(name: 'PIZZA CHECK', category: 'Pizza')
Restaurant.create(name: 'Kaduya', category: 'Ramen')
Restaurant.create(name: 'Pizza Giardino Savoy', category: 'Pizza')
Restaurant.create(name: 'Katsu Midori Meguro', category: 'Sushi')
Restaurant.create(name: 'Yakiniku Myeongdong', category: 'Korean')
Restaurant.create(name: 'Tonkatsu Taihou', category: 'Pork Cutlet')
Restaurant.create(name: 'Takemura', category: 'Ramen')
Restaurant.create(name: 'Kosuge', category: 'Soba')
Restaurant.create(name: 'Wagaya', category: 'Korean')
Restaurant.create(name: 'WAWICH', category: 'Vietnamese')
Restaurant.create(name: 'Joint', category: 'Burger')

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
puts "Admin is #{group.group_members.find_by_admin(true).user.name}"
