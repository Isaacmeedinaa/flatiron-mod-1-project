# The purpose of this method is to list all reviews and 
# allow users to delete a selected review

def delete_review(user)
  prompt = TTY::Prompt.new

  list = list_all_reviews(user)

  # We check if user has any reviews to display a list.
  if list.length > 0

    puts "\n"
    num = prompt.ask("Please select the review you would like to delete:")
    
    while num.to_i > list.length || num.to_i == 0
      puts "Invalid choice, please try again. 🛑"
      puts "\n"
      num = prompt.ask("Please select the review you would like to delete:")
    end
    puts "You are about to delete this review:"
    puts "\n"
    this_review = list[num.to_i - 1]
    puts "#{num.to_i}. #{this_review.restaurant.name} (#{this_review.restaurant.restaurant_food_type.name}) - Rating: #{this_review.rating} on #{this_review.created_at.strftime("%F")}"
    puts "\n"

    # we ask users if they are sure to delete the review
    if prompt.yes?('Are you sure you want to delete this review? 🤔')
      Review.destroy(this_review.id)
      puts "Your review has been deleted!"
    else
      puts "No review was deleted."
    end
  end
end