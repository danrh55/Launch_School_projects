Combine Two Lists
Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

Example:

```ruby
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
```
input: two arrays of same size
output: single array with alternating values

implicit:
- the first argument array's element comes first in the alternation.

data structure:
- array

notes:




```ruby
def interleave(arr1, arr2)
  new_arr = []
  index = 0

  loop do
    new_arr.push(arr1[index])
    new_arr.push(arr2[index])
    index += 1
    break if new_arr.size == (arr1 + arr2).size
  end
  new_arr
end

# this works but makes the logic unnecessarily complex
def interleave(arr1, arr2)
  index = 1
  arr2.each_with_object(arr1) do |element, arr1| 
    arr1.insert(index, element)
    index += 2 
  end
end

# using zip

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten(2)
end
```

Lettercase Counter
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one represents the number of characters that are uppercase letters, and one represents the number of characters that are neither.

Examples

```ruby
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
```

input: string
ouput: hash

implicit:
- space is considered a character
- empty string, still return hash

data structure:
- intermediate: array

notes:
- regex
- iterate through?

algorithm:
Split up the string into its characters and place them into an array
initalize an hash { lowercase: 0, uppercase: 0, neither: 0 }
iterate through the new array
  - if the element equals the element converted to lowercase increment the value of key lowercase 
  - else if the element equals the element converted to uppercase increment the value of key uppercase
  - else increment the value of key neither
return hash

```ruby
def letter_case_count(str)
  str.split('').each_with_object({ lowercase: 0, uppercase: 0, neither: 0 }) do |element, hash|
    case element
    when /[a-z]/
      hash[:lowercase] += 1
    when /[A-Z]/
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end
end
```
Capitalize Words
Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

Examples

```ruby
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
```

input: non-blank characters string
output: capitalized words string

implicit: 
- not capitalize words in quotations

data structure
- array

algo:
split the string into its words and place them inside an array
iterate through each word and map a new array by capitalizing each word
join the words back into a single string and return that value

```ruby
def word_cap(str)
  str.split(' ').map {|word| word.capitalize}.join(' ')
end
```

Swap Case
Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

Example:

```ruby
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
```

algo:


```ruby
def swapcase(str)
  lower = ('a'..'z').to_a
  upper = ('A'..'Z').to_a

  str.split('').map do |chr|
    if lower.include?(chr)
      upper[lower.index(chr)]
      # lower.upcase
    elsif upper.include?(chr)
      lower[upper.index(chr)]
      # lower.downcase
    else
      chr
    end
  end.join('')
end
```

Staggered Caps (Part 1)
Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

Example:

```ruby
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
```

input: string
output: stagger capitalization

implicit:
- consider characters already capital part of the stagger
- whitspace considered as character
- skips capital for non alphabet characters but keeps the pattern
- start with capital character pattern

data structure:
- array

notes:
- hardest part is handling the pattern => using index value

algo:
split up the string into its characters and place them inside an array
initalize index variable with 0
iterate through each character and map new array
  if index is odd capitalize,
  else convert to lowercase
  increment the value of index variable by 1
join the characters back into single string


```ruby
def staggered_case(str)
  index = 0

  new_str = str.split('').each_with_object([]) do |chr, new_str_arr|
    new_str_arr.push(index.even? ? chr.upcase : chr.downcase)
    index +=1
  end.join('')
end
```

Staggered Caps (Part 2)
Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

Example:

```ruby
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
```

implicit:
- no mixing of alphabetic and non-alphabetic characters?
- based on the upper, lower based on the last alphabetic character

```ruby
def staggered_case(str)
  index = 0

  new_str = str.split('').each_with_object([]) do |chr, new_str_arr|
    new_str_arr.push(index.even? ? chr.upcase : chr.downcase)
    index +=1 if chr =~ /[a-zA-Z]/
  end.join('')
end
```

Multiplicative Average
Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

Examples:

```ruby
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
```

note:
- hard part is getting it output trailing decimal zeroes.
- 

```ruby
def show_multiplicative_average(arr)
  multiplied = 1
  arr.each do |num|
    multiplied *= num
  end
  format('%.3f', multiplied/(arr.size.to_f)*1.000)
end
```

Multiply Lists
Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

Examples:

```ruby

def multiply_list(arr1, arr2)
  new_arr = []
  arr1.size.times do |index|
    new_arr.push(arr1[index] * arr2[index])
  end
  new_arr
end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map {|pair| pair[0] * pair[1]}
end
```

Multiply All Pairs
Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

Examples:

```ruby
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
```

implicit:
- can be different array sizes
- can have repeating values

algo:
initialize empty array
iterate through first array 
  iterate through second array
    multiply the first array element by second array element and add to to new array
sort the new array and retun the value

```ruby
def multiply_all_pairs(arr1, arr2)
  pairs_arr = []

  arr1.each do |num1|
    arr2.each do |num2|
      pairs_arr.push(num1 * num2)
    end
  end
  pairs_arr.sort
end
```

The End Is Near But Not Here
Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

Examples:

```ruby
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'
```

```ruby
def penultimate(str)
  str.split(' ')[-2]
end
```
Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.

edge cases
- single letter
- empty

grab middle.
- no middle number
size divide by 2 and grab the index of the next value unless less than 3. 

How Many
Write a method that counts the number of occurrences of each element in a given array.

```ruby
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
```
The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

Expected output:

Copy Code
car => 4
truck => 3
SUV => 1
motorcycle => 2

algo:
initalize empty hash
iterate over array
  - if element is a key incrment its value by 1
  - else add element as a new key with value 1
return hash

```ruby
def count_occurrences(arr)
  arr.each_with_object({}) do |element, hash|
    if hash.key?(element)
      hash[element] += 1
    else
      hash[element] = 1
    end
  end
end
```