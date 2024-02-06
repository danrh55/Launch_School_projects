Longest Sentence
Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

Example text:
Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.s

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.
s
The longest sentence in the above text is the last sentence; it is 86 words long. (Note that each -- counts as a word.)

Another Example

Download the book at http://www.gutenberg.org/cache/epub/84/pg84.txt, and run your program on this file.

The longest sentence in this book is 157 words long.

Now I Know My ABCs

A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

Examples: 

```ruby
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true
```
P:
input: single word
out: boolean

implicit:
- how is the blocks passed in? what data structure?
- Letters don't repeat. 

explicit:
- single character from each.

D: 
nested array, delete array if used once. flatten to check. 

A:
- initalize blocks variable with the nested arrays
- initalize block_word = ''
- iterate through each character in input_str
  - iterate through each nested array
    - if the nested array include the character,
      - concat the character to word
      - delete array from block array
- block_word == input

```ruby

def block_word?(input_str)
  input_str.upcase!
  block_letters = [%w(B O), %w(X K), %w(D Q), %w(C P), 
                  %w(N A), %w(G T), %w(R E), %w(F S), 
                  %w(J W), %w(H U), %w(V I), %w(L Y), %w(Z M)]
  block_word = ''
  input_str.chars.each do |chr|
    block_letters = block_letters.select do |block|
      if block.include?(chr)
        block_word += chr
        false
      else
        true
      end
    end
  end
  block_word == input_str
end

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true
```

Lettercase Percentage Ratio

In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples

```ruby
letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
```

P:
input: string, can have white space
output: hash with three key values

D: hash

A: 
- initalize an empty hash
- initalize total_characters with the length of the string
- use regex to find the number of lowercase letters
- use regex to find the number of uppercase letters
- use regex to find the non-word characters and whitespace
- divide each value by the total_characters and multiply by 100. add that to the hash as key and value.
- return hash

```ruby
def letter_percentages(str)
  hash = {}
  total_char = str.length.to_f
  hash[:lowercase] = str.chars.count { |chr| chr =~ /[a-z]/} / total_char * 100
  hash[:uppercase] = str.chars.count { |chr| chr =~ /[A-Z]/} / total_char * 100
  hash[:neither] = str.chars.count { |chr| chr =~ /[^a-zA-Z]/} / total_char * 100
  hash
end
```

Matching Parentheses?

Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Examples:

```ruby
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false
balanced?('What ())(is() up') == false
```
Note that balanced pairs must each start with a (, not a ).

P: 
input: string with parentheses
output: boolean

D: 
email
notes:
can i do this with just regex? 
just match the number of ( vs ) X it has to start with '(' and match. 
select out just () 


Triangle Sides

A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

Examples:

```ruby
triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid
```

P:
input: 3 integer or float value
output: symbol of four possible outcomes

implicit:
- the order doesn't matter in which the length of the sides are given.

D:
- array

notes:
- compare against each other. sort by value then use the first two values as the smaller length sides.

A:
- add the argument values to an array.
- sort the array.
- if the array contains the value 0 return :invalid
- if the first two values is less than the third, return :invalid
- iterate through the argument values and map how many times each value appears in the arguments array
- if the count array contains the value 3, return :equailateral
- if the count array countains the value 2, return :isosceles
- else return :scalene

```ruby
def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  return :invalid if sides.any?(&:zero?) || (sides[0..1].sum < sides[2])
  uniq_vals = sides.uniq.size

  case uniq_vals
  when 1
    :equilateral
  when 2
    :isosceles
  else
    :scalene
  end
end
```
Tri-Angles

A triangle is classified as follows:

right: One angle of the triangle is a right angle (90 degrees)
acute: All 3 angles of the triangle are less than 90 degrees
obtuse: One angle is greater than 90 degrees.
To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

Examples:

```ruby
triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid
```

```ruby
def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

 case
  when angles.reduce(:+) != 180, angles.include?(0)
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
```
Unlucky Days

Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

Examples:

```ruby
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2
```
P:
input: the year as integer
output: number of occurrences as integer.

explicit:
- gregorian calendar

notes:
- leap years?
- what dates are fridays?
- 400 year cycles
- date object

D:


A:
initialize fri13 with 0
1oop 12 times
create new date object with the year, the iteration num as the month, and 13 as the day
increment fri13 if the new created object is a friday using the friday? method
return fri13

```ruby
def friday_13th(year)
  num_fri_13th = 0
  12.times do |itr|
    date = Date.new(year, itr + 1, 13)
    num_fri_13th += 1 if date.friday?
  end
  num_fri_13th
end
```
```ruby
def five_fridays(year)
  five_fridays_months = 0
  12.times do |itr|
    day_of_month = Date.new(year, itr + 1)
    num_fridays = 0
    loop do
      num_fridays += 1 if day_of_month.friday?
      day_of_month += 1
      break if day_of_month.month == (day_of_month - 1).next_month.month
    end
    five_fridays_months += 1 if num_fridays >= 5 
  end
  five_fridays_months
end

def count_months_with_five_fridays(year)
  limit = Date.new(year, 12, 31)
  fridays = Array.new(12, 0)

  Date.new(year).step(limit) do |date|
    fridays[date.month - 1] += 1 if date.friday?
  end

  fridays.count(5)
end
```
Next Featured Number Higher than a Given Value

A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

Examples:

```ruby
featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987
featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
```

P:
input: random integer
output: next featured number

implicit:
- integer argument is a random number and not a featured number

D:
array for getting uniue digits

notes:
- can't possible map all the possible featured numbers
- loop until calculate featured number
- start from the passed in num

A: 
featured_num? method
- pass in multiples of 7 only as an argument
return true if odd and its digits are unique 

featured method
multiple = (input % 7) * 7
loop
  next_featured  = multiple if featured_num?(multiple)
  multiple += 7
  break if next_featured > input
end

```ruby
def featured_num?(multiple)
  multiple.odd? && multiple.digits.uniq.size == multiple.digits.size
end

def featured(num)
  return 'There is no possible number that fulfills those requirements' if num >= 9_999_999_999
  multiple = (num.divmod(7))[0] * 7
  next_featured = multiple
  loop do
    if featured_num?(multiple)
      next_featured = multiple
    end
    multiple += 7
    break if next_featured > num 
  end
  p next_featured
end
```

Bubble Sort

Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

6	2	7	1	4	Start: compare 6 > 2? Yes
2	6	7	1	4	Exchange
2	6	7	1	4	6 > 7? No (no exchange)
2	6	7	1	4	7 > 1? Yes
2	6	1	7	4	Exchange
2	6	1	7	4	7 > 4? Yes
2	6	1	4	7	Exchange
2	6	1	4	7	2 > 6? No
2	6	1	4	7	6 > 1? Yes
2	1	6	4	7	Exchange
2	1	6	4	7	6 > 4? Yes
2	1	4	6	7	Exchange
2	1	4	6	7	6 > 7? No
2	1	4	6	7	2 > 1? Yes
1	2	4	6	7	Exchange
1	2	4	6	7	2 > 4? No
1	2	4	6	7	4 > 6? No
1	2	4	6	7	6 > 7? No
1	2	4	6	7	1 > 2? No
1	2	4	6	7	2 > 4? No
1	2	4	6	7	4 > 6? No
1	2	4	6	7	6 > 7? No
1	2	4	6	7	No swaps; all done; sorted
We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.

For further information, including pseudo-code that demonstrates the algorithm as well as a minor optimization technique, see the Bubble Sort wikipedia page.

Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

Examples

```ruby
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
```
P:
input: array of values
output: sorted array

implicit:
- will have values of the same type
- based on ascii and from smallest to largest. 
explicit:
- mutate the original array.
- at least two elements

D:
array. 

A:
initalize first_index = 0
initalize second_index = 1
loop
  compare the value of the first_index with the second_index
  if the value of second is greater than first
    use multiple reassignment to switch the values.
  increment both indexes
return mutated array

```ruby
def bubble_sort!(arr)
  arr.size.times do |_|
    first_index = 0
    second_index = 1

    while second_index < arr.size
      if arr[first_index] > arr[second_index]
        arr[first_index], arr[second_index] = arr[second_index], arr[first_index]
      end
    first_index += 1
    second_index += 1
    end
  end
  arr
end
# optimization 1 last index to check is one less than previous last
def bubble_sort!(array)
  array_size = array.size
  loop do
    swapped = false
    1.upto(array_size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end
    array_size -= 1
    break unless swapped
  end
end
# optimization 2 dynamically chooses upto which index to check instead of just one less than previous last
def bubble_sort!(array)
  array_size = array.size
  loop do
    starting_index = 0
    1.upto(array_size - 1) do |index|
      if array[index - 1] > array[index]
        array[index - 1], array[index] = array[index], array[index - 1]
        starting_index = index
      end
    end
    array_size = starting_index
    break if array_size <= 1
  end
end

```
Sum Square - Square Sum

Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

Examples:

Copy Code
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150

```ruby
def sum_square_difference(int)
  (1..int).reduce(:+)**2 - (1..int).reduce { |sum, n| sum + (n ** 2) }
end
```
Is It Prime?

A prime number is a positive number that is evenly divisible only by itself and 1. Thus, 23 is prime since its only divisors are 1 and 23. However, 24 is not prime since it has divisors of 1, 2, 3, 4, 6, 8, 12, and 24. Note that the number 1 is not prime.

Write a method that takes a positive integer as an argument and returns true if the number is prime, false if it is not prime.

You may not use Ruby's Prime class to solve this problem. Your task is to programmatically determine whether a number is prime without relying on any methods that already do that for you.

Examples:

Copy Code
puts(is_prime(1) == false)              # true
puts(is_prime(2) == true)               # true
puts(is_prime(3) == true)               # true
puts(is_prime(4) == false)              # true
puts(is_prime(5) == true)               # true
puts(is_prime(6) == false)              # true
puts(is_prime(7) == true)               # true
puts(is_prime(8) == false)              # true
puts(is_prime(9) == false)              # true
puts(is_prime(10) == false)             # true
puts(is_prime(23) == true)              # true
puts(is_prime(24) == false)             # true
puts(is_prime(997) == true)             # true
puts(is_prime(998) == false)            # true
puts(is_prime(3_297_061) == true)       # true
puts(is_prime(23_297_061) == false)     # true

P: 

input: integer
output: boolean