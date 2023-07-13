# frozen_string_literal: true

# declares string literals as immutable. More compute friendly.
# asks for two numbers
puts 'Enter in your first number'
num1 = gets.chomp.to_f
puts 'Enter in your second number'
num2 = gets.chomp.to_f

# asks for operation
puts <<-TEXT
What operation do you want to perform
  1. add
  2. subtract
  3. multiply
  4. divide
TEXT

operation = gets.chomp

case operation
when 'add'
  puts num1 + num2
when 'subtract'
  puts num1 - num2
when multiply
  puts num1 * num2
when 'divide'
  puts num1 / num2
end
