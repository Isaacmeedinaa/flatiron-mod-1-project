require_relative '../config/environment'


prompt = TTY::Prompt.new
a_choice = [["small", 1], ["medium", 2], ["large", 3]]
h_choices = a_choice.to_h
choices = {small: 1, medium: 2, large: 3}
x = prompt.enum_select("What would you like to do next?", h_choices)
binding.pry
# puts "Welcome to our Review App!"
# puts "\n"
# username = prompt.ask('What is your name?', default: ENV['USER'])
# puts "\n"
# response = prompt.yes?('Do you like Ruby?')
# puts response
# choices = ['', '', '', '', '', '', '']
# prompt.enum_select("What would you like to do next?", choices)