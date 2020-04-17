# This method's purpose is to list all the of user's reviews

def list_all_reviews(user)
  prompt = TTY::Prompt.new
  review_list = user.reviews.order(created_at: :desc)
  if review_list.length > 0
    puts "Here are all your reviews:"
    puts "\n"
    review_list.each_with_index do |item, index|
      puts "  #{index + 1}) #{item.restaurant.name} (#{item.restaurant.restaurant_food_type.name}) - Rating: #{item.rating} on #{item.created_at.strftime("%F")}"
      puts "     Comments: '#{item.review_text}'"
    end
    
  else 
    puts "You have no reviews."  
  end
  puts "\n"

  # we return the list of reviews for other methods use
  review_list

  if review_list.length > 0
    # User is given the option to list all reviews or list restaurants by food type
    puts "\n"
    num = prompt.ask("Please select a review.")
    while num.to_i > review_list.length || num.to_i == 0
      puts "Invalid choice, please try again. 🛑"
      puts "\n"
      num = prompt.ask("Please select a review.")
    end
    # present user with the option to update or delete review
    menu_list = [["Update review", 1],["Delete review", 2],["Return", 3]]
    puts "\n"
    choice = prompt.enum_select("What would you like to do? 🤔", menu_list.to_h)
    if choice == 1
      update_review(review_list[num.to_i - 1], user)
    elsif choice == 2
      delete_review(review_list[num.to_i - 1])
      else
        puts "\n"
      end
    end
end