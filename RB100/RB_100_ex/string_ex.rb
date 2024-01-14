empty_str = String.new

puts "It's now 12 o'clock"

name = "Roger"

puts name.downcase == "RoGeR".downcase
puts name == "DAVE"

name = "Elizabeth"
puts "Hello, #{name}!"

first_name = "John"
last_name = "Doe"
full_name = first_name + " " + last_name
puts full_name

state = 'tExAs'
state.capitalize!
puts state

greeting = 'Hello'
puts greeting.replace('Goodbye!')

alphabet = 'abcdefghijklmnopqrstuvwxyz'
puts alphabet.split('')

words = 'car human elephant airplane'
words.split(' ').each do |word| 
  p word + 's'
end

colors = 'blue pink yellow orange'
puts colors.split(' ').include?('yellow')
puts colors.split(' ').include?('purple')
colors = 'blue boredom yellow'
puts colors.include?('red')
