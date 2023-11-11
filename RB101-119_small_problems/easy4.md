1. Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

Examples:

```ruby
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"
```
Problem:

Input: two strings
Output: single string

Rules:

implicit:
- no space in between characters

explicit:
- one string will always be shorter than the other.
- short one, then long, then short again.

Data structures:

no data structure needed:

Algorithm:

If the first string length is greater than the second string
  - return str2 + str1 + str2
else
  return str1 + str2 + str1

Code:

```ruby
def short_long_short(str1, str2)
  if str1.length > str2.length
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end
```

explain:

**What Century is That?** modulus weakness, relationship between float and int in context of modulus 
Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

Examples:

```ruby
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
```
input: integer
output: century string

Units of functionality/model:
- figure out the century value
- concatenate the string value corresponding to the century value

implicit: 
- passed in argument will always be an integer
- the corresponding century string follows some pattern.

explicit:
- new century begin in years that end with 1

Data structure:
- none

Algorithm:
`century` method
- If the float_num / 100 > int_num /100
  - century_num = int_num/100 + 1
- Else assign century_num = int_num/100
- convert the century_num into a string.
- Add each character into an array.
- concatenate the last two index characters, convert to an integer and assign it to the last_two_digits variable
- call the century_str method with the value of the last_two_digits variable as an argument
- assign the return value of the century_str to str variable
- convert the value of the century_num variable to a string and concatenate it with the value of the str variable.


`century_str` method
- Define a hash {1 => 'st', 2 => 'nd', 3 => 'rd'}
- If the last_two_digits value is 11, 12, or 13 return 'th'
- else return hash[last_two_digits % 10]


Code

```ruby
def century(year)
  if (year.to_f / 100) > (year / 100)
    century_num = (year / 100) + 1
  else
    century_num = year / 100
  end

  last_two_digits = century_num.to_s.split('').last(2).join('').to_i
  century_num.to_s + century_str(last_two_digits)
end

def century_str(last_two_digits)
  hash = {1 => 'st', 2 => 'nd', 3 => 'rd'}
  if [11, 12, 13].include?(last_two_digits) 
    'th'
  elsif [1, 2, 3].include?(last_two_digits % 10)
    hash[last_two_digits % 10]
  else
    'th'
  end
end
```

Leap Years (Part 1)
In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.

```ruby
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true
```
input: integer
output: boolean

implicit:
- integers only for argument

explicit:
- assume no exceptions to the given rule.
- argument will always be greater than 0

Data structure:
input: none
output: none

Algorithm:
- if the year is divisible by 4
  - if the year is divisible by 100
    - return true if it is divisible by 400, false otherwise
  - else return true
- else return false

```ruby
def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      year %  400 == 0 ? true: false
    else
      true
    end
  else
    false
  end
end

def leap_year?(year)

```
I'm not thinking deeply about the given rules and just going in the order given. 

Leap Years (Part 2)
A continuation of the previous exercise.

The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to determine leap years both before and after 1752.

```ruby
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true
```

```ruby
def leap_year?(year)
  if year < 1752
    year % 4 == 0
  else
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    else
      year % 4 == 0
    end
  end
end
```

Multiples of 3 and 5
Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

```ruby
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168
```
input: number
output: number

implicit:
- integers only
- multiple only included once if the number is a multiple of both 3 and 5.
- the sum does not include 1

explicit:
- passed in argument is greater than 1

Data structure:
input: none
output: none

Algorithm:
define a sum variable = 0

iterate over a range starting from 2 to the passed in argument value. 
  if the block parameter is divisible by 3
    - increment the value of the sum variable by 3
  elsif the block parameter is divisible by 5
    - increment the value of the sum variable by 5
return the value of the sum variable.

```ruby
def multisum(num)
  sum = 0

  (2..num).each do |num|
    if num % 3 == 0
      sum += num
    elsif num % 5 == 0
      sum += num
    end
  end
  sum 
end
```

Running Totals
Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

Examples:

```ruby
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
```
A running total is the sum of all values in a list up to and including the current element. Thus, the running total when looking at index 2 of the array [14, 11, 7, 15, 20] is 32 (14 + 11 + 7), while the running total at index 3 is 47 (14 + 11 + 7 + 15).

input: array
output: array

implicit:
- returns empty array if argument array empty. 

Data structure:
- input: array
- output: new array

Algorithm:
Define an empty array
Initialize the sum variable with integer 0

Iterate through each element in the array
  - increment the value of the sum variable by each element
  - push the value of the sum variable to the new array.
Return the new array.

```ruby
def running_total(arr)
  total_arr = []
  sum = 0;

  arr.each do |num|
    sum += num
    total_arr.push(sum)
  end
  total_arr
end
```

Convert a String to a Number!
The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

Examples

```ruby
string_to_integer('4321') == 4321
string_to_integer('570') == 570
```

input: numeric string
output: integer

implicit:
- no whitespace

explicit:
- no other characters other than numeric string

Data structure:
- input:
- output: 
- intermediate: array for digit version, hash to define string version and integer version relationship

Algorithm:
Define a key-value pair data structure. They key should be the string version of each digit. e.g. '0' => 0
Initialize a new empty array.
Split up the argument value into individual digits and place them inside an array. 
Iterate through the array and for each element
  - push hash value for each element to the new array
Initialize int_num variable with 0
initalize multiplier variable with 1
Loop n times, where n is the length of the array.
  - multiplier *= 10
Initialize int_num variable with 0
Iterate through the new array and for each integer
  - int_num variable += element * multiplier
  - multiplier /= 10
return int_num

```ruby
def string_to_integer(str)
  str_to_int = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}
  int_arr = []
  
  str.split('').each do |str_num|
    int_arr.push(str_to_int[str_num])
  end

  int_num = 0
  multiplier = 1

  (int_arr.size).times do |i|
    next if i == 0
    multiplier *= 10
  end

  int_arr.each do |int|
    int_num += (int * multiplier)
    multiplier /= 10
  end
  int_num
end
```

```ruby
def string_to_integer(str)
  str_to_int = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}
  
  int_arr = str.split('').map {|str_num| str_to_int[str_num]}

  int_num = 0
  int_arr.each {|int| int_num = 10 * int_num + int }

  int_num  
end
```

Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.

Example:
```ruby
hexadecimal_to_integer('4D9f') == 19871
```
Data structure:
- input: str
- output: integer
- intermediate: array

<!-- Algorithm:
Create a hash structure defining the relationship between letter characters and integer value.
Split the argument value into its characters and place them inside an array. 
Map the array to its integer versions. 
  - if the element converted to uppercase equals the element
    - call the string_to_integer method with the element as an argument
  - else return the corresponding value in the hex_digit hash structure
initalize int_array_length variable with int_arr - 1
intialize value with 0
Iterate through the new integer array
  - value += integer multiplied by (16 exponent int_array_variable value)
return value  -->

```ruby
def hexadecimal_to_integer(hex_string)
  hex_digits = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, 
                'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15}

  int_arr = hex_string.chars.map {|char| hex_digits[char.downcase]}

  hex_power = int_arr.size - 1
  value = 0

  int_arr.each do |int| 
    value += int * (16 ** hex_power)
    hex_power -= 1
  end
  
  value
end

STRING_DIGITS = ("0".."9").to_a

def string_to_integer(string)
  integer_digits = string.chars.map do |char|
    STRING_DIGITS.index(char)
  end

  integer_digits.reverse.each_with_index.sum do |digit, index|
    digit * (10 ** index)
  end
end

def string_to_integer(str)
  num_hash = ('0'..'9').zip(0..9).to_h
  str.chars.reduce(0) do |sum, char| 
    10*sum + num_hash[char]
  end
end
```

Convert a String to a Signed Number!
In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

Examples

```ruby
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
```

input: string number
output: integer number

explicit:
- string number with + sign just returns integer with no sign in front
- always will be a valid string number

data structure:
if the character in the first index equals '+'
  - call the string_to_integer method with the number string passed as an argument except the first character.
  - return the return value of the string_to_integer method call
else if the character in the first index equals '-'
  - call the string_to_integer method with the number string passed as an argument except the first character.
  - return the return value of the string_to_integer method call times -1
else
  return the return value of the string to integer method call

```ruby
def string_to_signed_integer(str)
  case str[0]
  when '+' 
    string_to_integer(str[1..-1])
  when '-'
    string_to_integer(str[1..-1]) * -1
  else
    string_to_integer(str)
  end
end

def string_to_signed_integer(str)
  first_char = str[0]
  int_num = string_to_integer(first_char == '-' || first_char == '+' ? str[1..-1] : str)

  case first_char
  when '-' then int_num * -1
  else          int_num
  end
end
```

Convert a Number to a String!
In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

Examples

```ruby
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'
```

input: integer
output: string

explicit: 
- positive or zero integer

data structure:
input: na
output: na
intermediate: array, hash to define relationship

algorithm:
Define a int_to_str hash that create a one to one relationship between integer digit and string digit
Define an empty array 
Loop
  - push the remainder of the value of the int variable divided by 10 to the new array 
  - Reassign the value of the int variable with its current value divided by 10
  - break out of loop if the value of the int value is less than 1

Initalize str_num variable with an empty string.
Iterate through the new array
  - concatenate the value of the str_num with the value of int_to_str hash with the element acting as a key.
Return str_num

```ruby
def integer_to_string(int)
  # int_to_str = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }
  int_to_str = (0..9).zip('0'..'9').to_h
  int_arr = []

  loop do
    int_arr.prepend(int % 10) # did not account for that i would be adding the lowest place digit first. 
    int /= 10 # not happy with the logic here
    # break if int < 1
    break if int.divmod(10)[0] == 0
  end

  str_num = ''
  int_arr.each do |digit|
    str_num += int_to_str[digit]
  end

  str_num
end


# def integer_to_string(int)
#   int_to_str = (0..9).zip('0'..'9').to_h
#   str_num = ''

#   loop do
#     str_num.prepend(int_to_str[int % 10])
#     int /= 10
#     break if int.divmod(10)[0] == 0
#   end
#   str_num
# end

def integer_to_string(int)
  int_to_str = (0..9).zip('0'..'9').to_h
  str_num = ''

  loop do
    int, remainder = int.divmod(10)
    str_num.prepend(int_to_str[remainder])
    break if int == 0
  end
  str_num
end
```
Convert a Signed Number to a String!
In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

Examples

```ruby
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
```

```ruby
def signed_integer_to_string(int)
  str_num = integer_to_string(int.abs)
  if str_num == '0'
    str_num
  else
    str_num.prepend(int > 0 ? '+' : '-')
  end
end
```