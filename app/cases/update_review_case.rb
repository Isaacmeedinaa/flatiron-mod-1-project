# This method handles the update review selection.
# A user is able to list to their reviews, select a review,
# and update it.
# User is also given the option to mark a restaurant as favorite.

def update_review(user)
    prompt = TTY::Prompt.new

    list = list_all_reviews(user)

    # We check if user has any reviews to display a list.
    if list.length > 0
        puts "Please select the review you would like to update:"
        puts "\n"

        num = gets.chomp

        # custom code to check for selection out of bounds.
        while num.to_i > list.length || num.to_i == 0
            puts "Invalid choice, please try again. 🛑"
            puts "\n"
            num = gets.chomp
        end

        puts "\n"
        
        updated_review_text = prompt.ask("Please provide a new review text:") do |q|
            q.required true
        end

        puts "\n"
        updated_review_rating = prompt.slider('Please provide a review rating:', max: 10, step: 1)

        selected_review = list[num.to_i - 1]

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
end