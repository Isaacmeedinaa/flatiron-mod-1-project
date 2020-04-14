def menu_drive(current_user)
  puts "\n"
  puts "What would you like to do next?"
  puts "\n"
  puts "1. Write a review"
  puts "2. List all my reviews"
  puts "3. Update a review"
  puts "4. Delete a review"
  puts "5. List all restaurants"
  puts "9. Exit"
  puts "\n"
  option_menu_choice = gets.chomp
  puts "\n"
  case option_menu_choice.to_i
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
  else
    
  end
  if option_menu_choice != "9"
    puts "\n"
    puts "Hit Enter to return"
    a = gets.chomp 
    print "\e[2J\e[f"
  end
  option_menu_choice.to_i
end