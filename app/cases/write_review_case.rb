def write_review(user)
    prompt = TTY::Prompt.new
    puts "1. List all restaurants"
    puts "2. List restaurants by food type"
    puts "\n"

    write_review_choice = gets.chomp
    puts "\n"


    if write_review_choice.to_i == 1
        restaurant_choice = list_all_restaurants()
    else
        restaurant_food_type_list = RestaurantFoodType.all.order(:name)

        restaurant_food_type_list.all.each_with_index do |food_type, i|
            puts "#{i+1}. #{food_type.name}"
        end

        puts "\n"

        food_type_choice = gets.chomp

        while food_type_choice.to_i > restaurant_food_type_list.length || food_type_choice.to_i == 0
            puts "Invalid choice, please try again."
            puts "\n"
            food_type_choice = gets.chomp
        end

        restaurant_food_type = restaurant_food_type_list[food_type_choice.to_i - 1]

        restaurant_choice = list_all_restaurants(restaurant_food_type.id)        
    end

    puts "\n"
    puts "What restaurant would like to write a review for?"
    puts "\n"

    searched_restaurant = gets.chomp    

    while searched_restaurant.to_i > restaurant_choice.length || searched_restaurant.to_i == 0
        puts "Invalid choice, please try again."
        puts "\n"
        searched_restaurant = gets.chomp
    end

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

    if prompt.yes?('Are you sure you want to post this review?')
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