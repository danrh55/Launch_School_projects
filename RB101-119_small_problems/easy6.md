Cute angles
Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Examples:

```ruby
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
```
Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:

```ruby
DEGREE = "\xC2\xB0"
```
input: integer
output: string

implicit:
- no leading zeroes for degrees
- round any values to nearest second

Data structure:
-

notes:
- format method
- variable for degree, min, sec
- using characteristic of to_i? bad code? not clear for 3rd person if that was intentional. 
- divmod, modulo, remainder does not work as intended for floats. just round down as it will always be fractions of a decimal?

Algorithm:
initialize the degree variable with the quotient of the argument value divided by 1
initalize the min variable with the quotient of (previous remainder * 60) divided by 1
initalize the sec variable with the remainder of the previous multiplied by 60 rounded to nearest whole number
call format method to format string return value  

```ruby
def dms(num)
  degree_num, remainder = num.divmod(1)
  min, remainder = (remainder * 60).round(2).divmod(1)
  sec = (remainder * 60).round

  p format("%d%s%02d'%02d\"", degree_num, DEGREE, min, sec)
end
```

Since degrees are normally restricted to the range 0-360, can you modify the code so it returns a value in the appropriate range when the input is less than 0 or greater than 360?

```ruby
dms(400) == %(40°00'00")
dms(-40) == %(320°00'00")
dms(-420) == %(300°00'00")
```

```ruby
def normalize_degree(int)
  loop do
    if int < 0
      int += 360
    elsif int > 360 
      int -= 360
    end

    break if int >= 0 && int <= 360
  end
  int 
end
```

Delete vowels
Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

Example:

```ruby
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
```

input: array of strings
output: array with a,e,i,o,u removed from string elements

implicit:
- same array object?
- case does not matter

data structure:
- array

notes:
- regex

Algorithm:
iterate through each string element
  using regex find every instance of the character a,e,i,o,u (both cases) and replace it with empty string (mutate original object)

```ruby
def remove_vowels(arr)
  arr.each do |str|
    str.gsub!(/[aeiou]/i, '')
  end
end
```

Fibonacci Number Location By Length
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

Examples:

```ruby
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
```
You may assume that the argument is always greater than or equal to 2.

input: integer, number of digits
output: integer, iteration at which we get desired number of digits

implicit:
-

data structure:
- 

algorithm:

counter = 1
previous_num = 1
current_num = 1
define a loop
  - sum = current_num + previous_num
  - previous_num = current_num
  - current_num = sum
  - counter += 1
return the value of variable counter

```ruby
def find_fibonacci_index_by_length(num_digits)
  starting_counter = 2
  previous_num = 1
  current_num = 1
  
  loop do
    sum = current_num + previous_num
    previous_num = current_num
    current_num = sum
    counter += 1
    break if current_num.to_s.length == num_digits
  end
  
  counter
end
```
***Reversed Arrays (Part 1)***
Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Examples:

```ruby
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true
```
Note: for the test case list = ['abc'], we want to reverse the elements in the array. The array only has one element, a String, but we're not reversing the String itself, so the reverse! method call should return ['abc'].

input: array
output: original array mutated

implicit:
- empty array, returns empty array

data structure:
- 

notes:
- do it as a pair? placeholder variable? logic can be confusing
1,2,3,5,6
- can't push to new array. 
- clone? X
- gsub?
- prepend then delete instead of trying to do it in one operation

algorithm:
<!-- initalize reverse_index variable with the value -1
initalize index variable with value 0
map a new array by mutating the original arr
  - reassign the array[index] = arr[reverse_index]
  - increment the index variable
  - decrement the reverse_index variable -->

initalize reverse_index with -1 
Iterate over the arr equal to the size of arr
  - prepend the arr with the last element in arr
  - delete the last element in the arr
return arr


```ruby
# def reverse!(arr)
#   reverse_index = -1
#   index = 0

#   arr.map! do |_element|
#     arr[index] = arr[reverse_index]
#     index += 1
#     reverse_index -= 1
#   end
# end

def reverse!(arr) 
  index = 0
  arr.size.times do |_|
    arr.insert(index, arr[-1]).pop
    index += 1
  end
  p arr
end

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end
```

Reversed Arrays (Part 2)
Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

Examples:

```ruby
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true
```

```ruby
def reverse(arr)
  arr.each_with_object([]) do |element, new_arr|
    new_arr.prepend(element)
  end
end

def reverse(arr)
  p arr.reduce([]) {|new_arr, element| [element] + new_arr}
  arr.reduce([], :prepend)
end
```

Combining Arrays
Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

Example

```ruby
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
```
input: two arrays
output: single array

implicit:
- same array sizes for input arguments?
- in order?
- any possible nesting?
explicit:
- no duplicate values

Data structure
- array

notes:

Algorithm:
Combine the two arrays together
iterate through the combined array
 - insert each element to a new arr if there is no equivalent value already in it
sort and return new arr

```ruby
def merge(arr1, arr2)
  (arr1 + arr2).each_with_object([]) {|element, new_arr| new_arr.push(element) if !(new_arr.include?(element))}
end

def merge(arr1, arr2)
  arr1 | arr2
end
```
Halvsies
Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

Examples:

```ruby
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
```

input: single array
output: array with two nested arrays

implicit:
- empty array returns array with two nested empty arrays

Data structure
- array

Algorithm:
<!-- container empty array
first nested array 
second nested array
counter = 1
iterate through argument array
  if array size is even
    if counter <= arr size / 2
      push element into first_nested_arr
    else
      push element into second_nested_arr
  else
    if counter < (arr size / 2) + 1
      push element into first_nested_arr
    else
      push element into second_nested_arr
  increment counter by 1.
return container array -->

notes:
- using evenness?
- using index value? logic harder to follow

```ruby
def halvsies(arr)
  container_arr = []
  first_arr = []
  second_arr = []
  counter = 1

  arr.each do |element|
    if counter < (arr.size / 2).round
      first_arr.push(element)
    else
      second_arr.push(element)
    end
    counter += 1
  end
  container_arr << first_arr, second_arr
end

def halvsies(arr)
  middle = (arr.size/2.0).round
  container_arr = [arr[0, middle], arr[middle, arr.size - middle]]
end
```

Find the Duplicate
Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

Examples:

```ruby
find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
```
input: single array
output: single value

implicit:
- always array of integers?
explicit:
- only one duplicate value, rest unique values

Data structure:
- na

algorithm


```ruby
def find_dup(arr)
  arr.reject {|element| arr.count(element) == 1}[0]
end

def find_dup(arr)
  arr.find()
end
```
Does My List Include This?
Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

```ruby
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false
```

input: array, single value
output: boolean

implicit: 
- empty array always return false

data structure:


```ruby
def include?(arr, search_val)
  arr.each do |element|
    return true if element == search_val
  end
  false
end
```
***Mutation***
What will the following code print, and why? Don't run the code until you have tried to answer.

```ruby
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
```
When the `each` method is called by the value of array1, it appends array2 with each element with the array assigned to variable `array1`. When the appending action occurs, as with any other object, it sends a copy of the object's reference value (object passing). Therefore when elements within the array held by variable `array1` is mutated, the elements that was appended to the array value assigned to variable `array2` is also mutated. 