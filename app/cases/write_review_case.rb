def write_review(user)
    puts "What restaurant would like to write a review for?"
    puts "\n"

    searched_restaurant = gets.chomp
    found_restaurant = Restaurant.find_by(name: searched_restaurant)

    until found_restaurant || searched_restaurant == "exit" do
        puts "\n"
        puts "No restaurant found, try again"
        searched_restaurant = gets.chomp
        found_restaurant = Restaurant.find_by(name: searched_restaurant)
    end

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