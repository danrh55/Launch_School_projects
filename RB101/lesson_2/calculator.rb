#asks for two numbers
puts "Enter in your first number"
num1 = gets.chomp.to_f
puts "Enter in your second number"
num2 = gets.chomp.to_f

#asks for operation
puts "What operation do you want to perform (add, subtract, multiply, or divide)"
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

