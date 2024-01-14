# Repeat Yourself
Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

Example:
```ruby
repeat('Hello', 3)
```
Output:

Hello
Hello
Hello

```ruby
def repeat(str, num)
  num.times { puts str }
```
# Odd
Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

Examples:

```ruby
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
```
Keep in mind that you're not allowed to use #odd? or #even? in your solution.

```ruby
def is_odd?(num)
  (num % 2) != 0
end
```

# Stringy Strings
Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

Examples:
```ruby
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
```
The tests above should print `true`.

```ruby
def stringy(num)
  string = ''
  num.times do |index|
    if index.even?
      string += '1'
    else
      string += '0'
    end
  end
  string
end    
```
Modify stringy so it takes an additional optional argument that defaults to 1. If the method is called with this argument set to 0, the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.

```ruby
def stringy(num, start_with = 1)
  string = ''
  num.times do |index|
    if start_with == 1
      insert_num = index.even? ? '1' : '0'
      string += insert_num
    else
      insert_num = index.even? ? '0' : '1'
      string += insert_num
    end
  end 
  string
end    
```
# What's my Bonus?
Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

Examples:

```ruby
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
```
The tests above should print `true`.

```ruby
def calculate_bonus(salary, bonus_true)
  (salary / 2) if bonus_true
  0
end
```
# Bannerizer
Write a method that will take a short line of text, and print it within a box.

Example:

```ruby
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
```

```ruby
print_in_box('')
+--+
|  |
|  |
|  |
+--+
```
You may assume that the input will always fit in your terminal window.

```ruby
def print_in_box(str)
  puts "+#{'-' * (str.length + 2)}+"
  puts "|#{' ' * (str.length + 2)}|"
  puts "| #{str} |"
  puts "|#{' ' * (str.length + 2)}|"
  puts "+#{'-' * (str.length + 2)}+"
end
```

use slice
```ruby

```
# Right Triangles
Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

Examples:

`triangle(5)`

    *
   **
  ***
 ****
*****

`triangle(9)`

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********