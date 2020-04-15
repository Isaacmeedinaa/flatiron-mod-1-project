def update_review(user)
    list = list_all_reviews(user)
    if list.length > 0
        puts "Please select the review you would like to update:"
        puts "\n"

        num = gets.chomp

        while num.to_i > list.length || num.to_i == 0
            puts "Invalid choice, please try again."
            puts "\n"
            num = gets.chomp
        end

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
        if gets.chomp.downcase == "yes"
            selected_review.update(review_text: updated_review_text, rating: updated_review_rating)
            puts "Your review has been updated!"
        else
            puts "Review has not been updated."
        end
    end
end