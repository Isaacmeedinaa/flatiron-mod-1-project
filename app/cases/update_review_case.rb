def update_review(user)
    list = list_all_reviews(user)

    puts "Please select the review you would like to update:"
    puts "\n"

    num = gets.chomp

    puts "\n"
    puts "Please provide a new review text:"
    puts "\n"
    updated_review_text = gets.chomp

    puts "\n"
    puts "Please provide a new review rating:"
    puts "\n"
    updated_review_rating = gets.chomp

    selected_review = list[num.to_i - 1]

    puts "\n"
    puts "Are you sure?"
    puts "\n"
    if gets.chomp == "Yes"
        selected_review.update(review_text: updated_review_text, rating: updated_review_rating)
        puts "Your review has been updated!"
    else
        puts "Review has not been updated."
    end

end