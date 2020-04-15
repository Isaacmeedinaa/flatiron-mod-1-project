require_relative '../config/environment'


prompt = TTY::Prompt.new

puts "Welcome to our Review App!"
puts "\n"
username = prompt.ask('What is your name?', default: ENV['USER'])
puts "\n"
response = prompt.yes?('Do you like Ruby?')
puts response
choices = ['', '', '', '', '', '', '']
prompt.enum_select("What would you like to do next?", choices)