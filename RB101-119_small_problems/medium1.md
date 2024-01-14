Rotation (Part 1)
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Example:

```ruby
rotate_array([7, 3, 5, 2, 9, 1]) == 12
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
```
problem:

input: array
output: new array

implicit:
- empty array return empty?
- single element, return single element array.
explicit:
- new array (no muatation)

example:
```ruby
x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
```

D:
array

A:
define a new array.

iterate through each element and push to new array except the first element
push the first element to new array unless the original array size is less than 2

C:
```ruby
def rotate_array(x)
  new_arr = x[1..-1].each_with_object([]) do |element, arr|
    arr.push(element)
  end
  new_arr.push(x[0])
end
```
Rotation (Part 2)
Write a method that can rotate the last n digits of a number. For example:

```ruby
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917
```
Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

P:

input: two integer arguments. 
output: single integer

implicit:
- moves the integer at the corresponding with the 2nd argument place to the back.
- second argument value always less than or equal to the number of digits in first integer argument?
explicit:
- 

Data structure
array

A:
covert the first integer to a string
split the string into an array
slice the array starting from the last element and using the second argument value for the number of elements to slice. assign it to back_num variable
slice the array from the start and using the array size minus the 2nd argument value for the number of elements to slice. assign it to front_num variable.
combine the front_num variable back into string.
pass in the value of back_num variable into rotate_array method. combine the return value back to string.
cocat the converted fron_num string and back_num string together. convert the return value back to integer.

```ruby
def rotate_right_most_digits(int, digits)
  int_arr = int.to_s.split
  back_num = rotate_array(int_arr.slice(-1, digits)).join('')
  front_num = int_arr.slice(0, int_arr.size - digits).join('')
  (front_num + back_num).to_i
end
```

Rotation (Part 3)
If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

Example:

```ruby
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845
```
input: integer
output: rotated integer

implicit: 
- if rotation integer has leading zero, it is removed. 
explicit:

D:
- array

A:
- iterate through the number digits in given argument
- reassign the parameter variable with the return value of the rotate_rightmost_digits method call with the value of the method parameter variable as an argument. 
- return the value of the parameter variable

```ruby
def max_rotation(int)
  num_digits = int.digits.size
  num_digits.times { |itr| int = rotate_rightmost_digits(int, num_digits - itr) }
  int
end
```
1000 Lights
You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

input: integer (num lights)
output: array of integers (lights still on)

implicit:
- lights can be turned on and off multiple times 
- you toggle based on an increasing multiple, starting with 2
- in the first round, you turn on all the lights.

E:
```ruby
p on_lights(10) == [1, 4, 9]
p on_lights(5) == [1, 4] 
```

D:
array of booleans?
true for on
false for off

hash for each light number?

A:
define an empty hash
loop n times and append it with the key as an integer and value 'on'. Integer value starts at 1.
initalize starting_multiple = 2
loop n - 1 times
  key_value = starting multiple
  loop until key_value > n
    if the value of hash key value equals 'on' reassign it to 'off' and vice versa
    key_value += starting_multiple
  starting_multiple += 1

C:
```ruby
def on_lights(n)
  lights = {}
  n.times { |itr| lights[itr + 1] = 'on' }

  multiple = 2
  n.downto(2) do |_|
    key_value = multiple
    while key_value <= n
      status = lights[key_value]
      lights[key_value] = (status == 'on' ? 'off' : 'on')
      key_value += multiple
    end
    multiple += 1
  end
  lights.keys.select { |key| lights[key] == 'on' }
end
```

Diamonds!
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

Examples

diamond(1)
*
diamond(3)

 *
***
 *

diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

P:

input: integer
output: lines of '*' string

implicit:
- 1 will not make the shape.
explicit:
- always odd integer

D:
strings output centered

A:
initalize num_stars = 1
loop n times
- display to screen '*' string multiplied by num_stars
- if current (iteration+1) is greater than n divided by 2
    decrement by 2
  else
    increment by 2

```ruby
def diamonds(n)
  num_stars = 1
  n.times do |itr|
    if num_stars == 1
      puts ('*' * num_stars).center(n)
    else
      puts ('*' + ' '.center(n-num_stars) + '*')
    if (itr + 1) > (n /2)
      num_stars -= 2
    else
      num_stars += 2
    end
  end
end
```

Stack Machine Interpretation
A stack is a list of values that grows and shrinks dynamically. In ruby, a stack is easily implemented as an Array that just uses the #push and #pop methods.

A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack. Operations that require two values pop the topmost item from the stack (that is, the operation removes the most recently pushed value from the stack), perform the operation using the popped value and the register value, and then store the result back in the register.

Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register value, removes the value from the stack, and then stores the result back in the register. Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the stack), and a register value of 7, then the MULT operation will transform things to 3 6 on the stack (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, then the stack is transformed to 3, and the register is left with the value 168.

Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

n Place a value n in the "register". Do not modify the stack.
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value
All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument. Your program may assume that all programs are correct programs; that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.

You should initialize the register to 0.

Examples:

```ruby
minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
```
Word to Digit
Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Example:
```ruby
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
```
P:
input: string
output: string

implicit:
- has to be a sequence of words? 
- no numbers greater than 9

edge:
- the first word in sentence being a number word.
- word having period character. 

D:
- array to iterate, hash to define relationship

A:
- split up the string to its word characters
- iterate through each word character
  - if the word character or its capitalized character is included in our numbers array
  - reassign index value with the index number converted to string
  - else if the word except the last character is in our number array
    reassign index value with the index number converted to string concatenated with '.'
- rejoin words back to single string.

```ruby
def word_to_digit(sentence)
  num_arr = %w(zero one two three four five six seven eight nine)
  sentence.split(' ').map do |word|
    if num_arr.include?(word.downcase)
      num_arr.index(word)
    elsif num_arr.include?(word[0..-2].downcase)
      num_arr.index(word[0..-2]).to_s + '.'
    else
      word
    end
  end.join(' ')
end
```
Fibonacci Numbers (Recursion)
The Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is the sum of the two previous numbers: the 3rd Fibonacci number is 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In mathematical terms:

```ruby
F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2
```
Sequences like this translate naturally as "recursive" methods. A recursive method is one in which the method calls itself. For example:

```ruby
def sum(n)
  return 1 if n == 1
  n + sum(n - 1)
end
```
sum is a recursive method that computes the sum of all integers between 1 and n.

Recursive methods have three primary qualities:

They call themselves at least once.
They have a condition that stops the recursion (n == 1 above).
They use the result returned by themselves.
In the code above, sum calls itself once; it uses a condition of n == 1 to stop recursing; and, n + sum(n - 1) uses the return value of the recursive call to compute a new return value.

Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

If you find yourself struggling to understand recursion, see this forum post. It's worth the effort learning to use recursion.

That said, this exercise is a lead-in for the next two exercises. It verges on the Advanced level, so don't worry or get discouraged if you can't do it on your own. Recursion is tricky, and even experienced developers can have trouble dealing with it.

Examples:

```ruby
fibonacci(1) == 1
fibonacci(2) == 1
fibonacci(3) == 2
fibonacci(4) == 3
fibonacci(5) == 5
fibonacci(12) == 144
fibonacci(20) == 6765
```

```ruby
def fibonacci(n)
  return 1 if n <= 2
  fibonacci(n-1) + fibonacci(n-2)
end
```
Fibonacci Numbers (Procedural)
In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. In a language that is not optimized for recursion, some (not all) recursive methods can be extremely slow and require massive quantities of memory and/or stack space.

Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; as a result, the Fibonacci solution is only useful up to about fibonacci(40). With higher values of nth, the recursive solution is impractical. (Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

Rewrite your recursive fibonacci method so that it computes its results without recursion.

Examples:

```ruby
fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501
```
```ruby
def fibonacci(n)
  return 1 if n <= 2

  first = 1
  second = 1
  sum = first + second 
  counter = 3

  while counter < n
    first = second
    second = sum
    sum = first + second
    counter += 1
  end
  sum
end
```
Fibonacci Numbers (Last Digit)
In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

Examples:

```ruby
fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4
```
```ruby
def fibonacci_last(n)
  fibonacci(n).digits[0]
end
```


# reverse, rotating
# conversions without using to_i and to_s
# my own include?, swapcase, squeeze
# kernel format unfamiliar, ASCII value (easy 5)




