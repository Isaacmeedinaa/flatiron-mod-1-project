require 'json'
require 'rest-client'
require 'pry'
require_relative '../app/models/user.rb'

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
    arr << r["restaurant"]["timings"]
    arr << r["restaurant"]["location"]["address"]
    arr << r["restaurant"]["price_range"]
    rest_list << arr
end

p rest_list

rest_list.each do |item|
    restaurant = Restaurant.create(name: item[0], city: "Chicago", timings: item[2], address: item[3], price_range: item[4])
    restaurant_food_type = RestaurantFoodType.find_by(name: item[1])
    
    if !restaurant_food_type
        restaurant_food_type = RestaurantFoodType.create(name: item[1])
    end

    restaurant_food_type.restaurants << restaurant
end
