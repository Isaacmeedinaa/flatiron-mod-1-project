require_relative '../config/environment'
# require_relative 'write_review_case.rb'

# binding.pry

puts "Welcome to our Review App!"
puts "\n"
puts "Please type in your username:"

username = gets.chomp

current_user = User.find_user_by_name(username)

if !current_user
    puts "Username not found!"
    exit!
end

puts "\n"
puts "Hello, #{username}! What would you like to do?"

puts "\n"
puts "1. Write a review"
puts "2. List all my reviews"
puts "3. Update a review"
puts "4. Delete a review"
puts "5. List all restaurants"
puts "\n"

option_menu_choice = gets.chomp
puts "\n"

case option_menu_choice.to_i
when 1
    write_review(current_user)
when 2
    puts "Here are all your reviews:"
when 3
    update_review(current_user)
when 4
    puts "Select which review you will like to delete:"
when 5
    list_all_restaurants
end

# 1. Write a review !COMPLETED!
    # What restaurant would like to write a review for?
    # if restaurant is not found: "No restaurant found, try again".
    # (loop until we get an 'exit', or 'found restaurant')
    # If restaurant is found, continue.
        # Please provide a review message:
        # Please provide a rating:
            # Are you sure you want to post this review? 
                # If 'yes', post (save).
                # If 'no', exit.

# 2. List all my reviews
    # Here are all your reviews:

# 3. Update a review !COMPLETED (needs review)!
    # Here are all your reviews, please choose one:
        # Please enter updated review text:
        # Please enter updated review rating:
            # Are you sure you want to update this review?
                # If 'yes', update (update).
                # If 'no', exit.

# 4. Delete a review
    # Here are all your reviews, please choose one:
        # Are you sure you want to delete this review?
            # If 'yes', delete (delete).
            # If 'no', exit.

# 5. List all restaurants !COMPLETED!
    # Here are all the restaurants: