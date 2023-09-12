# Searching 101
Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

Examples:
==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

```ruby
entry_prompts = %w(1st 2nd 3rd 4th 5th)
entries = []
for prompt in entry_prompts 
  puts "Enter the #{prompt} number:"
  entries << gets.chomp.to_i
end
puts 'Enter the last number'
last_num = gets.chomp.to_i
if entries.include?(last_num)
  puts "The number #{last_num} appears in #{entries}"
else
  puts "The number #{last_num} does not appears in #{entries}"
end
```

# Arithmetic Integer
Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

Example

==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103

```ruby
puts 'Enter the first number:'
first_num = gets.chomp.to_i
puts 'Enter the second number:'
second_num = gets.chomp.to_i

puts "#{first_num} + #{second_num} = #{first_num + second_num}"
puts "#{first_num} - #{second_num} = #{first_num - second_num}"
puts "#{first_num} * #{second_num} = #{first_num * second_num}"
puts "#{first_num} / #{second_num} = #{first_num / second_num}"
puts "#{first_num} % #{second_num} = #{first_num % second_num}"
puts "#{first_num} ** #{second_num} = #{first_num ** second_num}"
```
# Counting the Number of Characters
Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

input:
Please write word or multiple words: walk

output:
There are 4 characters in "walk".

input:
Please write word or multiple words: walk, don't run

output:
There are 13 characters in "walk, don't run".

```ruby
print 'Please write word or multiple words: '
str_arr = gets.chomp.split(' ')
str_length = 0
for str in str_arr 
  str_length += str.length
end
puts "There are #{str_length} characters in #{str}"
```
# Multiplying Two Numbers
Create a method that takes two arguments, multiplies them together, and returns the result.

Example:

multiply(5, 3) == 15

```ruby
def multiply(num1, num2)
  num1 * num2
end
```

# Squaring an Argument
Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

Example:
```ruby
square(5) == 25
square(-8) == 64
```

```ruby
def square(num)
  num ** num
end
```
# Exclusive Or
The || operator returns a truthy value if either or both of its operands are truthy. If both operands are falsey, it returns a falsey value. The && operator returns a truthy value if both of its operands are truthy, and a falsey value if either operand is falsey. This works great until you need only one of two conditions to be truthy, the so-called exclusive or.

In this exercise, you will write a method named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise. Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.

Examples:

```ruby
xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false
```
The tests above should print true.

```ruby
def xor?(param1, param2)
  if !!(param1) == true
    !!(param2) == false
  elsif !!(param2) == true
    !!(param1) == false
  else
    false
  end    
end
```

# Palindromic Strings (Part 1)
Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

Examples:

```ruby
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true
```
```ruby
def palindrome?(str)
  str.reverse == str
end
```
Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array. Now write a method that determines whether an array or a string is palindromic; that is, write a method that can take either an array or a string argument, and determines whether that argument is a palindrome. You may not use an if, unless, or case statement or modifier.

```ruby
def palindrome?(input)
  input.reverse == input
end
```
# Palindromic Strings (Part 2)
Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

Examples:

```ruby
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
```

```ruby
def real_palindrome?(str)
  palindrome?(str.downcase.delete('\'' ',' ' '))
end
```
# Palindromic Numbers
Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

Examples:

```ruby
palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true
```

```ruby
def palindromic_number?(num)
  palindromic?(num.to_s)
end
```
# Uppercase Check
Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

Examples:

```ruby
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true
```

```ruby
def uppercase?(str)
  str.upcase == str
end
```