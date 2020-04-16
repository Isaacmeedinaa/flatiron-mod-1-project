def list_all_restaurants(user)
    prompt = TTY::Prompt.new

    puts "\n"
    puts "Here are all the restaurants:"
    puts "\n"

    restaurant_list = Restaurant.all.order(:name)

    list = restaurant_list
    num_list = []
    list.each_with_index do |value, index|
        liste = []
        liste << value.name
        liste << index + 1
        num_list << liste
    end
    puts "\n"

    restaurant_choice = prompt.enum_select("Please select a restaurant to see details:", num_list.to_h, per_page: 10)
    rest_choice_id = restaurant_list[restaurant_choice - 1].id
    if Review.all.where(restaurant_id: rest_choice_id).length > 0
        avg_rating = "#{Review.all.where(restaurant_id: rest_choice_id).average(:rating).to_f.round(2)}/10 (#{Review.all.where(restaurant_id: rest_choice_id).length} reviews)" 
    else 
        avg_rating = "No reviews"
    end
    puts "\n"
    puts "   Name: #{restaurant_list[restaurant_choice - 1].name}"
    puts "   Address: #{restaurant_list[restaurant_choice - 1].address}"
    puts "   Timing: #{restaurant_list[restaurant_choice - 1].timings}"
    puts "   Price Range: #{restaurant_list[restaurant_choice - 1].price_range}"
    puts "   Average rating: #{avg_rating}"

    puts "\n"
    add_to_favorite_choice = prompt.yes?("Would you like to add this restaurant as your favorite?")

    if add_to_favorite_choice
        user.update(favorite_restaurant_name: restaurant_list[restaurant_choice - 1].name)
    end
end

# hash = Review.group(:restaurant_id).average(:rating)
# array = hash.max_by{|k,v|v}
# array[0] is the restaurant id array[1].to_f is the rating