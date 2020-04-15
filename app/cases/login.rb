def login
  puts "Please type in your username:"
  puts "\n"

  username = gets.chomp

  current_user = User.find_user_by_name(username)

  if !current_user
    puts "\n"
    puts "User not found. Would you like to create a new user?"
    puts "\n"
    if gets.chomp.downcase == "yes"
      current_user = User.create(name: username)
    else
      puts "\n"
      puts "User not logged in. Leaving now...."
      sleep(3)
      exit!
    end
  end
  current_user
end