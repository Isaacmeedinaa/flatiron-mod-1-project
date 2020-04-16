# This method's purpose is to handle the applications login.
# If a username entered by user doesn't exist, we allow the 
# user to create a username.

def login
  prompt = TTY::Prompt.new
  username = prompt.ask('Please type in your username:')
  puts "\n"

  current_user = User.find_user_by_name(username)

  if !current_user
    puts "\n"
    puts "\n"
    if prompt.yes?('User not found. Would you like to create a new user?')
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