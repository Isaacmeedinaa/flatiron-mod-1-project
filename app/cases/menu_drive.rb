# This method's purpose is to display a user friendly menu and 
# handle user selections.

def menu_drive(current_user)

  puts "\n"

  prompt = TTY::Prompt.new

  choices = [['Write a review', 1], ['List all my reviews', 2], ['List all restaurants', 3], ['Exit', 4]]
  option_menu_choice = prompt.enum_select("What would you like to do next? 🤔", choices.to_h)

  puts "\n"
  puts "\n"

  # Case to check user selection on the main menu
  case option_menu_choice
  
  # We run a method called "write_review" when user selection is 1
  # We also pass in the "current_user" to access the user's instance
  when 1
    write_review(current_user)
  
  # We run a method called "list_all_reviews" when user selection is 2
  # We also pass in the "current_user" to access the user's instance
  # user can also update and delete reviews from there
  when 2
    list_all_reviews(current_user)
  # We run a method called "list_all_restaurants" when user selection is 5
  # We also pass in the "current_user" to access the user's instance
  when 3
    list_all_restaurants(current_user)
  when 4
  else
    
  end

  # Implemented an if statement to check if the user selection is not equal to 6 (Exit)
  # if the if statement returns true, it will not exit the app until user selection is equal to 6
  if option_menu_choice != 4
    puts "\n"
    puts "Hit Enter to return"
    a = gets.chomp 
    print "\e[2J\e[f"
  end

  option_menu_choice
end