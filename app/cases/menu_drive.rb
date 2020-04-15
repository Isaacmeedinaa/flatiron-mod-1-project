def menu_drive(current_user)
  puts "\n"

  prompt = TTY::Prompt.new

  choices = [['Write a review', 1], ['List all my reviews', 2], ['Update a review', 3], ['Delete a review', 4], ['List all restaurants', 5], ['Exit', 6]]
  option_menu_choice = prompt.enum_select("What would you like to do next?", choices.to_h)

  puts "\n"
  puts "\n"
  case option_menu_choice
  when 1
    write_review(current_user)
  when 2
    list_all_reviews(current_user)
  when 3
    update_review(current_user)
  when 4
    delete_review(current_user)
  when 5
    list_all_restaurants()
  when 6
    exit
  else
    
  end
  if option_menu_choice != "Exit"
    puts "\n"
    puts "Hit Enter to return"
    a = gets.chomp 
    print "\e[2J\e[f"
  end
  option_menu_choice
end