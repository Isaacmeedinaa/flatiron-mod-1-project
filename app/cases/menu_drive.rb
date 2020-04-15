def menu_drive(current_user)
  puts "\n"

  prompt = TTY::Prompt.new

  choices = ['Write a review', 'List all my reviews', 'Update a review', 'Delete a review', 'List all restaurants', 'Exit']
  option_menu_choice = prompt.enum_select("What would you like to do next?", choices)

  puts "\n"
    # binding.pry

  # puts "1. Write a review"
  # puts "2. List all my reviews"
  # puts "3. Update a review"
  # puts "4. Delete a review"
  # puts "5. List all restaurants"
  # puts "9. Exit"
  puts "\n"
  case option_menu_choice
  when "Write a review"
    write_review(current_user)
  when "List all my reviews"
    list_all_reviews(current_user)
  when "Update a review"
    update_review(current_user)
  when "Delete a review"
    delete_review(current_user)
  when "List all restaurants"
    list_all_restaurants()
  when "Exit"
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