# This method's purpose is to list all the of user's reviews

def list_all_reviews(user)
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
end