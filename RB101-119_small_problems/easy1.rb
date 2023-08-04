# def repeat(str, num_outputs)
#   num_outputs.times {puts str}
# end

# repeat('Hello', 5)

# def is_odd?(int)
#   int.remainder(2) != 0
# end

# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

# def stringy(int, starts_with = '1')
#   string = ''
#   int.times do |index|
#     index += 1 if starts_with == '0' 
#     string += index.even? ? '1' : '0'
#   end
#   string
# end

# puts stringy(6)

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# def calculate_bonus(salary, gets_bonus)
#   gets_bonus ? salary*0.5 : 0
# end 

# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000

# def print_in_box(str)
#   str_array = str.split('.')
#   first_last_line = "+#{'-'*(str_array.max.length + 2)}+"
#   empty_lines = "|#{' '*(str_array.max.length + 2)}|"
  
#   puts first_last_line
#   puts empty_lines
#   str_array.each {|str| puts "| #{str}#{' '*(str_array.max.length - str.length)} |"}
#   puts empty_lines
#   puts first_last_line
# end

# text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
# puts print_in_box(text)

# def triangle(num_layers)
#   triangle_counter = num_layers 
#   loop do
#     puts "#{'*'*triangle_counter}#{' '*(num_layers - triangle_counter)}"
#     triangle_counter -= 1
#     break if triangle_counter < 0
#   end
# end

# triangle(9)

# print "Enter a noun: "
# noun = gets.chomp
# print "Enter a verb: "
# verb = gets.chomp
# print "Enter an adjective: "
# adjective = gets.chomp
# print "Enter a adverb: "
# adverb = gets.chomp

# puts "Do you #{verb} your #{adjective} #{noun} #{adverb}. That's hilarious!"

# def reversed_number(int)
#   new_num = int.to_s.reverse.to_i 
# end

# puts reversed_number(12345) == 54321
# puts reversed_number(12213) == 31221
# puts reversed_number(456) == 654
# puts reversed_number(12000) == 21 # No leading zeros in return value!
# puts reversed_number(12003) == 30021
# puts reversed_number(1) == 1

def center_of(phrase)
  if phrase.length.remainder(2) == 0
    phrase = phrase[(phrase.length/2)-1] + phrase[(phrase.length/2)]
  else
    phrase[(phrase.length/2)]    
  end
end



puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'