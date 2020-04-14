def update_review(user)
    puts "\n"
    puts "Select which review you would like to update:"
    puts "\n"

    user.reviews.each do |review|
        puts "#{review.id}. #{review.review_text}"
    end

    puts "\n"
    review_choice_input = gets.chomp

    selected_review = user.reviews.find_by(id: review_choice_input.to_i)

    if !selected_review
        puts "Invalid review selected!"
        exit!
    else
        puts "\n"
        puts "Please provide a new review text:"
        puts "\n"
        new_review_text = gets.chomp
        puts "\n"
        puts "Please provide a new review rating:"
        puts "\n"
        new_review_rating = gets.chomp

        selected_review.update(review_text: new_review_text, rating: new_review_rating)
        puts "\n"
        puts "Review updated!"
    end

    # binding.pry
end