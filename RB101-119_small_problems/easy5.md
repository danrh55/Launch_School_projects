ASCII String Value
Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

```ruby
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0
```

input: string
output: integer

implicit: 
- whitespace has a ascii value
- empty string returns 0 
explicit: 

Data structure
- array

Algorithm:
If the argument value is an empty string return 0
Else
  Break up the string value into each character and place in order inside an array.
  Iterate through each character and sum up the ascii values. Use #reduce
  return the sum value

```ruby
def ascii_value(str)
  # return 0 if str == '' # not necessary as reduce returns sum which is initalized with the passed in argument, which in this case is 0. 
  str.chars.reduce(0) {|sum, char| sum + char.ord}
end

def ascii_value(str)
  str.chars.map(&:ord).sum
end
```

After Midnight (Part 1)
The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Examples:

```ruby
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
```
Disregard Daylight Savings and Standard Time and other complications.

input: integer
output: string

implicit: 
- the integer value can circle around the 24 hours
- '00:00' is midnight, no 24:00

Data structure:
- 

notes:
- string interpolation
- how to handle the circle around logic: working from 0


Algorithm:
if the remainer of num divided by 1440 equals 0, return '00:00'

if the number is less the 0
  - loop until it is greater than 0, each time incrementing the value of the num variable by 1440 (24hr times 60min)
else
  - loop until the number minus 1440 is less than 0, each time decrementing the value of the num variable by 1440. unless decrementing the number will make it a negative value. 

initialize the hour_min_arr with num's quotient and remainder when divided by 60 in that order.

iterate through the hour_min_arr
  if element < 10 convert element to string and prepend it with '0'
  else convert element to string

return string interpolation of "{hour}:{min}"

```ruby
def time_of_day(num)
  return '00:00' if num % 1440 == 0

  loop do
    if num < 0
      num += 1440
    else
      num -= 1440 unless (num - 1440) < 0
    end
    
    break if (num < 1440 && num > 0)
  end

  hour_min_arr = num.divmod(60)

  hour_min_arr.map! do |element| 
    if element < 10
      element.to_s.prepend('0')
    else
      element.to_s
    end
  end

  hour = hour_min_arr[0]
  min = hour_min_arr[1]

  "#{hour}:#{min}"
end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

# -----------------------

def normalize_minutes_to_0_through_1439(minutes)
  minutes % MINUTES_PER_DAY 
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_t= HOUR)
  format('%02d:%02d', hours, minutes)
end

=begin 
# using Date and Time object
just choose a random sunday to instantiate an object
keep track of $ of 24 hour periods 


=end

```

After Midnight (Part 2)
As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

Examples:

```ruby
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0
```
Yes, we know that 24:00 isn't a valid time in 24-hour format. Humor us, though; it makes the problem more interesting.

Disregard Daylight Savings and Standard Time and other irregularities.

input: time string
output: minutes in integer

implicit: 
- 

Data structure
- array

Algorithm:
# after_midnight
split up the string argument value by ':' character and insert into array their int converted value into array. 
assign the first index element to hour variable, second to minute variable
reassign the hour variable by its current value multiplied by 60
return sum value of variables hour and minutes

# before_midnight
return 1440 minus the return value of after_midnight variable call with the before_midnight argument value passed as an argument.

```ruby
def after_midnight(time)
  if time == '00:00' || time == '24:00'
    0
  else
    hour, min = time.split(':').map(&:to_i)
    hour*60 + min 
  end
end

def before_midnight(time)
  if time == '00:00' || time == '24:00'
    0
  else
    1440 - after_midnight(time)
  end
end
```

Letter Swap
Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces.

Examples:

```ruby
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'
```
input: string
output: new string

implicit:
- if word has a single character, no change
- whitespace not considered as a character
- no case switching
explicit:
- at least one letter

Data structure
- array

notes:
gsub
store in separate variable?

Algorithm
- Split the string into each individual word and place them inside an array.
- Iterate through each word
  - assign the first character to first_char variable
  - assign the last character to last_char variable
  - mutate the word by changing the first character with the value of last_char
  - mutate teh word by changing the last character with the value of first_char
  - return word
- join all the words together with space in between and return that value

```ruby
def swap(str)
  switched_words_arr = str.split(' ').map do |word|
    first_char = word[0]
    last_char = word[-1]

    word[0] = last_char
    word[-1] = first_char
    word
  end
  switched_words_arr.join(' ')
end
```

Clean up the words
Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

Examples:

```ruby
cleanup("---what's my +*& line?") == ' what s my line '
```

input: string
output: new string

implicit:
- consequtive non-alphabetic characters is one space

explicit:
- no consequtive space.
- all lowercase alphabetic

notes
- regex?
- range a..z? 
- break up by characters. 

Data structure:
- array

Algorithm:
- initialize clean_up_str variable with an empty string.
- split up the string into its characters and insert into array
- Iterate through the array and see if the character is included in an array of alphabetic characters
  - if true, concanate the value of clean_up_str variable with the character
  - if false, concanate the value of clean_up_str variable with ' '. 
return the value of clean_up_str variable

```ruby
def cleanup(str)
  clean_up_str = ''
  str.split('').each do |char|
    if ('a'..'z').include?(char)
      clean_up_str += char
    else
      clean_up_str += ' ' unless clean_up_str[-1] == ' '
    end
  end
end
```

Letter Counter (Part 1)
Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

Examples

```ruby
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}
```

input: string
output: hash of word length

implicit:
- non-alphabetical characters are part of word
- space not counted as a character
- no order of hash

Data structure:
- array?
- output: hash

notes:
- each_with_object

Algorithm:
split up the string by each word and place the words inside an array
initalize an empty hash.
iterate through each word
  - if the word length is a key in the hash
    - increment the value associated with that key by 1
  - else
    - add the word length as a key with its associated value as integer 1
return the hash

```ruby
def word_sizes(str)
  str.split(' ').each_with_object({}) do |word, hash|
    word_length = word.length
    if hash.key?(word_length)
      hash[word_length] += 1
    else
      hash[word_length] = 1
    end
  end
end
```
Letter Counter (Part 2)
Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

Examples

```ruby
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}
```
```ruby
def word_sizes(str)
  word_arr = str.split(' ').map {|word| word.gsub(/[^a-zA-Z]/, '')}

  word_arr.each_with_object({}) do |word, hash|
    word_length = word.length
    if hash.key?(word_length)
      hash[word_length] += 1
    else
      hash[word_length] = 1
    end
  end
end
```

Alphabetical Numbers
Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Examples:

```ruby
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
```

input: array of integers
output: array of integers but sorted by its string version

implicit:
- sorting based on alphabetical order

data structure:
- hash, array

notes:
- zip method 

Algorithm:
- initalize a hash that define the string equivalent of the integer values as keys. 
- sort the hash by alphabetical order based on key value. It should return a nested array of key, value pair arrays
- Map a new array by iterating through the array of key, value pair arrays
  - at each iteration, return the index 1 value of the nested array
return new array.

```ruby
def alphabetic_number_sort(arr)
  %w(zero one two three four five six seven eight nine ten 
     eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen).zip(0..19).sort.map {|key_value| key_value[1]}
end
```

ddaaiillyy ddoouubbllee
Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

Examples:

```ruby
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
```

input: string
output: new string

implicit:
- whitespace duplicate?

Data structure:
- arr

notes:
- <=>
- each_with_index

Algorithm:
- split up the string by word and place them inside an array
- Iterate through each word and map it to new array.
  - Split up the string by its individual characters and place them inside an array
  - initalize new_str variable with an empty string.
  - Iterate through each character
    - append the first character to the value of the new_str variable.
    - append to the value of new_str variable unless the character in the previous index equals the character in current index
  - return value of new_str variable
join together each word in array and return new string value.

```ruby
def crunch(str)
  crunch_word_arr = str.split(' ').map do |word|
    new_str = ''

    word.chars.each_with_index do |chr, index|
      if index == 0
        new_str << chr 
      else 
        new_str << chr unless word[index] == word[index - 1]
      end
    end

    new_str
  end
  p crunch_word_arr
  crunch_word_arr.join(' ')
end

# using regex
def crunch(str)
  str.gsub(/(\w)\1*/, '\1')
end
```
Spin Me Around In Circles
You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

```ruby
def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"
```
The above code will return a different object than the one passed in. A string object is passed in as an argument but is converted to an array object with the `split` method. The `each` method iterates through each word in the array and mutates each word within the array. However, they are already different objects from the string passed in. The mutation by `reverse!` does not affect the string object passed in. Ultimately, a new string object is returned.  

List of Digits
Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

Examples:

```ruby
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]   
```
input: integer
output: array of integers with each element being the digit of the argument value

implicit
- output, argument integer digit order

Data structure
- output: array

Algorithm:
- convert the integer to a string.
- split into its string digits and place them insde an array.
- map new array by by converting each string digit to integers

```ruby
def digit_list(int)
  int.to_s.split('').map {|digit| digit.to_i}
end
```