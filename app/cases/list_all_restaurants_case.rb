def list_all_restaurants
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

    restaurant_choice = prompt.enum_select("Please select a restaurant to see details:", num_list.to_h)
    puts "\n"
    puts "   Name: #{restaurant_list[restaurant_choice - 1].name}"
    puts "   Address: #{restaurant_list[restaurant_choice - 1].address}"
    puts "   Timing: #{restaurant_list[restaurant_choice - 1].timings}"
    puts "   Price Range: #{restaurant_list[restaurant_choice - 1].price_range}"
end
