# This method handles the update review selection.
# User is also given the option to mark a restaurant as favorite.

def update_review(selected_review, user)
    prompt = TTY::Prompt.new       
    updated_review_text = prompt.ask("Please provide a new review text:") do |q|
        q.required true
    end
    puts "\n"
    updated_review_rating = prompt.slider('Please provide a review rating:', max: 10, step: 1)
    puts "\n"
    # ask user if they want to update review
    if prompt.yes?('Are you sure you want to update this review? 🤔')
        selected_review.update(review_text: updated_review_text, rating: updated_review_rating)
        puts "\n"
        puts "Your review has been updated!"

        # if rating is greater than 7, we ask if they want to mark that restaurant as favorite.
        if updated_review_rating > 7
            puts "\n"
            add_to_favorite_choice = prompt.yes?("You seem to like this restaurant. Would you like to add this restaurant as your favorite? 🤔")

            if add_to_favorite_choice
                user.update(favorite_restaurant_name: selected_review.restaurant.name)                
            end
        end
    else
        puts "Review has not been updated."
    end
end