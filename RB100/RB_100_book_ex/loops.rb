# puts "input something"
# input = gets.chomp 

# while input.upcase != "STOP"
#   puts "input something"
#   input = gets.chomp
# end 

def count_to_zero(num)
    p num
    num -= 1
    count_to_zero(num) if num >= 0
end



p count_to_zero(5)