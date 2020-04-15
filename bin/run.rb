require_relative '../config/environment'
# require_relative 'write_review_case.rb'

prompt = TTY::Prompt.new

print "\e[2J\e[f"
puts "Welcome to our Review App!"
puts "\n"

current_user = login
# puts "Please type in your username:"

# username = gets.chomp

# current_user = User.find_user_by_name(username)

# if !current_user
#     puts "Username not found!"
#     exit!
# end

print "\e[2J\e[f"
puts "\n"
puts "Hello, #{current_user.name}! Welcome to Review App!"

choice = menu_drive(current_user)
until choice == 9 do
    choice = menu_drive(current_user)
end

# def menu1
#     puts "\n"
#     puts "1. Write a review"
#     puts "2. List all my reviews"
#     puts "3. Update a review"
#     puts "4. Delete a review"
#     puts "5. List all restaurants"
#     puts "9. Exit"
#     puts "\n"

#     option_menu_choice = gets.chomp
#     puts "\n"

#     case option_menu_choice.to_i
#     when 1
#         write_review(current_user)
#     when 2
#         list_all_reviews(current_user)
#     when 4
#         delete_review(current_user)
#     end
#     option_menu_choice.to_i
# end
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