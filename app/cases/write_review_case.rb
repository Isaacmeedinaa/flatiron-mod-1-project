def write_review(user)
    prompt = TTY::Prompt.new
    menu_list = []
    menu_list << ["List all restaurants", 1] 
    menu_list << ["List restaurants by food type", 2]
    puts "\n"

    write_review_choice = prompt.enum_select("Please choose option:", menu_list.to_h, per_page: 10)
    puts "\n"


    if write_review_choice.to_i == 1
        restaurant_choice = Restaurant.all.order(:name)
    else
        restaurant_food_type_list = RestaurantFoodType.all.order(:name)

        list = restaurant_food_type_list
        num_list = []
        list.each_with_index do |value, index|
            liste = []
            liste << value.name
            liste << index + 1
            num_list << liste
        end
        puts "\n"

        food_type_choice = prompt.enum_select("Please select the food type:", num_list.to_h, per_page: 10)

        restaurant_food_type = restaurant_food_type_list[food_type_choice.to_i - 1]

        restaurant_choice = Restaurant.all.where(restaurant_food_type_id: restaurant_food_type.id)       
    end

    list = restaurant_choice
    num_list = []
    list.each_with_index do |value, index|
        liste = []
        liste << value.name
        liste << index + 1
        num_list << liste
    end

    puts "\n"

    searched_restaurant = prompt.enum_select("Please select the restaurant you want to review:", num_list.to_h, per_page: 10)

    found_restaurant = Restaurant.find(restaurant_choice[searched_restaurant.to_i - 1].id)

    puts "\n"
    puts "Please provide a review message:"
    puts "\n"
    review_message = gets.chomp
    review_rating = prompt.slider('Please provide a review rating:', max: 10, step: 1)
    
    puts "\n"
    if prompt.yes?('Are you sure you want to post this review?')
        new_review = Review.create(review_text: review_message, rating: review_rating)
        user.reviews << new_review
        found_restaurant.reviews << new_review
        puts "\n"
        puts "Review posted!"

        if review_rating > 7
            puts "\n"
            add_to_favorite_choice = prompt.yes?("You seem to like this restaurant. Would you like to add this restaurant as your favorite?")

            if add_to_favorite_choice
                user.update(favorite_restaurant_name: new_review.restaurant.name)                
            end
        end
    else
        puts "\n"
        puts "Review not posted!"
    end
    
end