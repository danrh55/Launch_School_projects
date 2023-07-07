# puts "Type anything you want: "
# input = gets.chomp 
# puts input 

# puts "Enter your age"
# age = gets.chomp.to_i
# puts "You are #{age*12} months old"


# puts "Do you want me to print something? (y/n)"
# answer = gets.chomp.downcase

# if answer == 'y'
#   puts "something"
# end

# while true
#   puts "Do you want me to print something"
#   answer = gets.chomp.downcase

#   if answer == 'y'
#     puts "something"
#     break
#   elsif (answer != 'y' && answer != 'n')
#     puts "invalid input"
#   else
#     break
#   end
# end

# puts "how many lines do you want? Enter a number >= 3"
# n =  gets.chomp.to_i

# loop do
#   break if n >= 3
#   puts "That's not enough lines"
#   n = gets.chomp.to_i
# end

# n.times do 
#   puts "launch school"
# end

# loop do
#   puts "Please enter your password"
#   password = gets.chomp
#   break if password == '544'
#   puts "Invalide password, try again!"
# end

# puts "Welcome"

# USER = 'ekc'
# PASSWORD = '7590'

# loop do 
#   puts "Enter your user name:"
#   user = gets.chomp
#   puts "Enter your password"
#   password = gets.chomp

#   break if user == USER && password == PASSWORD

#   puts "Authorization failed. Please try again"
# end

# puts "Welcome"

# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string
# end

# numerator = nil
# denominator = nil

# loop do 
#   puts "Enter the numerator"
#   numerator = gets.chomp

#   if valid_number?(numerator)
#     loop do
#       puts "Enter the denominator"
#       denominator = gets.chomp
#       if denominator.to_i == 0
#         puts "Cannot divide by 0"
#       elsif valid_number?(denominator)
#         break
#       else
#         puts "Invalid input, try again."
#       end
#     end
#     break
#   else
#       puts "Invalid input, try again."      
#   end  
# end

# puts numerator.to_i/denominator.to_i

# number_of_lines = nil
# loop do
#   puts '>> How many output lines do you want? Enter a number >= 3: (Q to quit)'
#   number_of_lines = gets.chomp
#   break if number_of_lines.to_s.downcase == 'q'
#   number_of_lines = number_of_lines.to_i

#   if number_of_lines <= 3 
#     puts ">> That's not enough lines."
#     next
#   end

  
#   while number_of_lines > 0 do
#     puts 'Launch School is the best!'
#     number_of_lines -= 1
#   end  
# end

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

loop do 
  puts "Please enter a positive or negative integer"
  num1 = gets.chomp
  puts "Please enter a positive or negative integer"
  num2= gets.chomp

  if (!valid_number?(num1) || !valid_number?(num2))
    puts "invalid input"
    next
  end

  if valid_number?(num1) && valid_number?(num2)
    num1 = num1.to_i
    num2 = num2.to_i
    if (num1 < 0 && num2 > 0) || (num1 > 0 && num2 < 0)
      puts num1 + num2
      break      
    elsif (num1 < 0 && num2 < 0) || (num1 > 0 && num2 > 0)
      puts "One integer must be positive, the other negative"
    end
  end

end



