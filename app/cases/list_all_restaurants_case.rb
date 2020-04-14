def list_all_restaurants(food_type=nil)
    
    puts "\n"
    puts "Here are all the restaurants:"
    puts "\n"

    if food_type
        restaurant_list = Restaurant.all.where(restaurant_food_type_id: food_type)
    else
        restaurant_list = Restaurant.all.order(:name)
    end

    restaurant_list.each_with_index do |restaurant, i|
        puts "#{i+1}. #{restaurant.name} located in #{restaurant.city}. Food type is: #{restaurant.restaurant_food_type.name}"
    end

    restaurant_list
end