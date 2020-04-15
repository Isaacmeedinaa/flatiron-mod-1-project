def delete_review(user)
  list = list_all_reviews(user)
  if list.length > 0
    puts "Please selete the review you would like to delete."
    puts "\n"
    num = gets.chomp
    while num.to_i > list.length || num.to_i == 0
      puts "Invalid choice, please try again."
      puts "\n"
      num = gets.chomp
    end
    puts "You are about to delete this review:"
    puts "\n"
    this_review = list[num.to_i - 1]
    puts "#{num.to_i}. #{this_review.restaurant.name} (#{this_review.restaurant.restaurant_food_type.name}) - Rating: #{this_review.rating} on #{this_review.created_at.strftime("%F")}"
    puts "\n"
    puts "Are you sure?"
    puts "\n"
    if gets.chomp.downcase == "yes"
      Review.destroy(this_review.id)
      puts "Your review has been deleted!"
    else
      puts "No review was deleted."
    end
    # review_list = user.reviews.order(created_at: :desc)
    # review_list.each_with_index do |item, index|
    #   puts "#{index + 1}. #{item.restaurant.name} (#{item.restaurant.restaurant_food_type.name}) - Rating: #{item.rating} on #{item.created_at.strftime("%F")}"
    #   puts "     Comments: '#{item.review_text}'"
    # end
  end
end