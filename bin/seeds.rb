require_relative '../config/environment'

Restaurant.destroy_all
RestaurantFoodType.destroy_all
Review.destroy_all

url = "https://developers.zomato.com/api/v2.1/cuisines?city_id=292"
a = RestClient.get(url, {"user-key" => "d69e6b8ed4f2ebcbc72de81478b91471"})
hash_from_internet = JSON.parse(a.body)
hash_from_internet["cuisines"]
puts hash_from_internet["cuisines"][0]["cuisine"]["cuisine_name"]

url1 = "https://developers.zomato.com/api/v2.1/search?entity_id=292&entity_type=city"
b = RestClient.get(url1, {"user-key" => "d69e6b8ed4f2ebcbc72de81478b91471"})
rest_internet = JSON.parse(b.body)
puts "#{rest_internet["restaurants"][0]["restaurant"]["name"]} + 
#{rest_internet["restaurants"][0]["restaurant"]["cuisines"]}"
rest_list = []
rest_internet["restaurants"].each do |r|
    arr = []
    arr << r["restaurant"]["name"]
    arr << r["restaurant"]["cuisines"]
    rest_list << arr
end

p rest_list

rest_list.each do |item|
    restaurant = Restaurant.create(name: item[0], city: "Chicago")
    restaurant_food_type = RestaurantFoodType.find_by(name: item[1])
    
    if !restaurant_food_type
        restaurant_food_type = RestaurantFoodType.create(name: item[1])
    end

    restaurant_food_type.restaurants << restaurant
end

# this will get every food type and put it on its own array
# food_type_list = rest_list.map do |restaurant_and_food_type|
#     restaurant_and_food_type[1]  
# end

# sets the unique version of the array to the variable 'food_type_list'
# food_type_list = food_type_list.uniq

# it makes a new RestaurantFoodType row for each string in the unique array
# food_type_list.each do |food_type|
#     RestaurantFoodType.create(name: food_type.to_s)
# end

binding.pry

