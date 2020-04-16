# This method lists all the restaurants with their details
# We also give the option to users to select a restaurant and
# make it their favorite

def list_all_restaurants(user)
    prompt = TTY::Prompt.new

    puts "\n"
    puts "Here are all the restaurants:"
    puts "\n"

    restaurant_list = Restaurant.all.order(:name)

    # call utility to get list into TTY prompt enum_select format
    num_list = get_enum_list(restaurant_list, :name)
    puts "\n"

    # Lets user select a restaurant
    restaurant_choice = prompt.enum_select("Please select a restaurant to see details:", num_list.to_h, per_page: 10)
    rest_choice_id = restaurant_list[restaurant_choice - 1].id
    if Review.all.where(restaurant_id: rest_choice_id).length > 0
        avg_rating = "#{Review.all.where(restaurant_id: rest_choice_id).average(:rating).to_f.round(2)}/10 (#{Review.all.where(restaurant_id: rest_choice_id).length} reviews)" 
    else 
        avg_rating = "No reviews"
    end
    puts "\n"
    # Prints out all of the restaurants details
    puts "   Name: #{restaurant_list[restaurant_choice - 1].name}"
    puts "   Food Type: #{restaurant_list[restaurant_choice - 1].restaurant_food_type.name}"
    puts "   Address: #{restaurant_list[restaurant_choice - 1].address}"
    puts "   Timing: #{restaurant_list[restaurant_choice - 1].timings}"
    puts "   Price Range: #{restaurant_list[restaurant_choice - 1].price_range}"
    puts "   Average rating: #{avg_rating}"

    puts "\n"

    # we ask if they want to mark that restaurant as favorite.
    add_to_favorite_choice = prompt.yes?("Would you like to add this restaurant as your favorite?")

    if add_to_favorite_choice
        user.update(favorite_restaurant_name: restaurant_list[restaurant_choice - 1].name)
    end
end