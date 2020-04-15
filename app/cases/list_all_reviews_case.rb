def list_all_reviews(user)
  review_list = user.reviews.order(created_at: :desc)
  if review_list.length > 0
    review_list.each_with_index do |item, index|
      puts "#{index + 1}. #{item.restaurant.name} (#{item.restaurant.restaurant_food_type.name}) - Rating: #{item.rating} on #{item.created_at.strftime("%F")}"
      puts "     Comments: '#{item.review_text}'"
    end
    puts "Here are all your reviews!"
  else 
    puts "You have no reviews."  
  end
  puts "\n"
  review_list
end