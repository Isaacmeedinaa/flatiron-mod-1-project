def write_review(user)
    puts "1. List all restaurants"
    puts "2. List restaurants by food type"
    puts "\n"

    write_review_choice = gets.chomp

    if write_review_choice.to_i == 1
        restaurant_choice = list_all_restaurants()
    else
        restaurant_food_type_list = RestaurantFoodType.all.order(:name)

        restaurant_food_type_list.all.each_with_index do |food_type, i|
            puts "#{i+1}. #{food_type.name}"
        end

        food_type_choice = gets.chomp
        restaurant_food_type = restaurant_food_type_list[food_type_choice.to_i - 1]

        restaurant_choice = list_all_restaurants(restaurant_food_type.id)
    end

    puts "What restaurant would like to write a review for?"
    puts "\n"

    searched_restaurant = gets.chomp
    found_restaurant = Restaurant.find(restaurant_choice[searched_restaurant.to_i - 1].id)

    # until found_restaurant || searched_restaurant == "exit" do
    #     puts "\n"
    #     puts "No restaurant found, try again"
    #     searched_restaurant = gets.chomp
    #     found_restaurant = Restaurant.find_by(name: searched_restaurant)
    # end

    puts "\n"
    puts "Please provide a review message:"
    puts "\n"
    review_message = gets.chomp

    puts "\n"
    puts "Please provide a review rating:"
    puts "\n"
    review_rating = gets.chomp

    puts "\n"
    puts "Are you sure you want to post this review?"
    puts "\n"
    confirmation = gets.chomp

    if confirmation == "Yes"
        new_review = Review.create(review_text: review_message, rating: review_rating.to_i)
        user.reviews << new_review
        found_restaurant.reviews << new_review
        puts "\n"
        puts "Review posted!"
    else
        puts "\n"
        puts "Review not posted!"
    end
    
end