puts 'Destroying Restaurants'
Restaurant.destroy_all

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
