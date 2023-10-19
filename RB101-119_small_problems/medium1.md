Rotation (Part 1)
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Example:

```ruby
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
```

Problem:

input: array
output: new array object

implicit: 
- moves clockwise. 
- should work for any data type 
- If the array is empty or has a single element, it should just return a copy of the original array. 

Mental model: what problem requires. 
Iterate through the original array starting with index 1 and push each element to an empty array. The element in the first 0 index should be pushed after the iteration ends. 


Data structure:
input: array
output: array
in-between: 

Algorithm:
- initalize a new variable with an empty array. 
- Iterate through the passed in array. Skip the first element.
  - for each element, add it to end of the newly defined array.
- Push the first element in the original array to the newly defined array. 

```ruby
def rotate_array(arr)
  new_arr = []
  arr.each_index do |index|
    next if index == 0
    new_arr.push(arr[index])
  end

  new_arr.push(arr[0])
end
```
```ruby
def rotate_array(array)
  array[1..-1] + [array[0]]
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

Problem:
input: two integers
output: single integer

implicit: 
- inputs will not include floats or other data types. 
- the second input will be less than or equal to the integer length
explicit:
- the n is always an integers

Data structure:
input: 2 integer
output: 1 integer
in-between: string 

Algorithm:
- Convert the first integer argument to a string
- Split up the string into its characters.
- splice the string into two. 
  - from 0 to array size minus n + 1 and split up into an array.
  - from -n to -1
  - assign both to a variable.
- Call the rotate_array method with the array as an argument.  
- Combine the elements within the array back into a single string
- Concat the two strings together with the string that was just combined as the second operand. 
- convert back into an integer

```ruby
def rotate_rightmost_digits(num, n)
  num_to_str = num.to_s
  front_digits = num_to_str[0..(num_to_str.size - (n+1))]
  back_digits = num_to_str[-n..-1]
  back_digits = rotate_array(back_digits.split('')).join('')
  (front_digits + back_digits).to_i
end
```
