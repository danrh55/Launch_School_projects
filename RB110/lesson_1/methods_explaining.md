#chars
The chars method is available to string objects and returns a new array with each character in the calling string object placed within it. It does not mutate the original string object. Strings appears to behave like a array of characters but is not in ruby. This is a design choice. When you have 'hello'[0] => 'h' the [] is just syntatical sugar for this perticular method. it returns a new 'h' character. it is not returning the 0 index value from the object 'hello'. They have different object ids. 

example:
```ruby
"hello world".chars => => ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
```
relative importance:
more efficient when we simply want to split them, but does not work when need to split it based on a delimiter.

#concat
The concat method takes in multiple values as arguments separated by commas and mutates the calling string object with the argument values. The arguments are appended to the end of the calling object. defined in array and string class. << only takes a single argument. Each argument is added as a single argument for <<

example:
```ruby
[1,2].concat([3,4],[5,6]) # => [1, 2, 3, 4, 5, 6]
'hello'.concat('future', 'me') # => 'hellofutureme'

[1,2] << [3,4] # => [1,2, [3,4]]
'hello' << 'world' # => 'helloworld'
```

relative importance:
push/append + flatten
push/append

#count
The count method is defined within the enumerable module and is inherited by the string, array, hash, range classes. count can be thought of as like a selection and can take a block as an argument. It uses the return boolean value of the block to determine whether to increment the count value. It can also take in a single argument value but only for string, array, range. It has to be an ordered collection to take in a single argument. It makes intuitive sense to take in a block as an argument also.

relative importance:
abstracts out the iterating process. iterating for a specific purpose. 

#downcase, #upcase
Define in the string class only and returns a new string of lowercase characters. There is the destructive version of the method where it mutates the original object instead of returning a new string object. It is defined in the symbol class as well but it is equivalent to just converting symbol to string calling the downcase method defined in the string class and converting it back to a symbol. 

#freeze
This method freezes any object from being manipulated in any way within the code. This includes inside values of data structure objects like arrays and hashes. it is also un-reversible. is the freeze method automatically called for immutable data types such as int, symbol, floats? no mutating methods are available for immutable data types but is that the same thing as freezing the object at instantiation?

relative importance:
difference between freeze and simply assigning it to a constant variable? relative strictness of non-mutability? its about the where the constantness lies. the variable or the actual object. you can still reassign variables initally assigned to a frozen object. 

#include?
This method checks for if the argument value equals a value inside the calling collection object. defined for array, range, and hash. for hashes it only checks against the hash keys. defined in the enumerable module. Takes in a single argument.

relative importance:
member?, key? alias
has_value?/value? 
none?, any?, one? all? leverages off the generic include? method takes block, criterion. 

#replace
replace is a method that mutates the original object with the given argument. it replaces the whole object so no block. defined in the array, hash, string classes. 

relative importance:
useful for when you need to simply mutate an object.
gsub specific pattern replace, match

#reverse, reverse!
reverses the order of an ordered collection type defined in array, string class. not for a range for some reason. maybe because range is for a values between certain values and not an individual element value ordered.

relative importance:
none

#size
should be aliased as length as well. makes more intuitive sense to use length for strings and size for arrays and hashes. returns the size/length of the object. the number of elements within the collection. 

#slice
should be aliased as [starting index, number of elements] well. should be defined in the string, array, range classes. no block arguments. 

relative importance:
slice_when

#split
no block. takes in single element for delimiter, default parameter of empty string. defined in the string class only. 

#strip
returns a new string with whitespace removed. no arguments. 

#fetch
This method is similar to the square bracket method but the advantage is that we can designate a default value if the index is not within range. we can also call a block if the index is not within range yielding the index value to the block. This method is also defined in the hash class but works with keys instead, returns the key's corresponding value. key

#partition
this method takens in an array as an argument and returns a new array of two arrays. The method calls a block for each element and if block returns a truthy value, the argument value is placed within the first arrray. If the block returns falsy it is placed in the second array. This is similar to selection but with both the selected and not selected values being returned. 

#sort
it uses the <=> comparision operator to sort an array. It can take in two argument values for the first element and second element that is being compared at each iteration. It returns 1 if the first element is greater than the second, -1 for vice versa. 0 if equal. 

#unshift shift
shift is remove, unshift is prepend.

#each_key, each_value

shallow copy
There is clone and dup method available but they only copy object it is being called by. If the object is a data structure, it does not create a copy of the objects placed within the copied object. the actual object is it called by is important. the dup doesn't preserve the frozen state of the object it duplicated, while clone does. the destructive map acts on the index association of object assigned to the array's indexes. clones copies internal state while dup instantiates a new object.

#reduce/inject
the main benefit of this method is to shorten the syntax of a common operation on a collection of objects. it iterates through a collection and combines each collection object with the return value of the previous block call. if no argument given, uses the first element of the collection as the starting value. no need to set a combined_value variable outside the block to keep track of the combined element values.

Longest
# Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

######

# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order.
# Whitespace and punctuation shall simply be removed!
# The input is restricted to contain no numerals and only words containing the english alphabet letters.

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

#####

# Given a string of words, you need to find the highest scoring word.

# Each letter of a word scores points according to it's position in the alphabet:
# a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs will be valid.

p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'

### Each, Map, Select

### Example 1

What does the following code return? What does it output? Why? What concept does it 	demonstrate?

array = [1, 2, 3, 4, 5]array.select do |num|   puts num if num.odd?end

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]arr.select { |n| n.odd? }

### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]new_array = arr.select do |n|   n + 1endp new_array

### Example 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]new_array = arr.select do |n|   n + 1  puts nendp new_array

### Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

words = %w(jump trip laugh run talk)new_array = words.map do |word|  word.start_with?("t")endp new_array

### Example 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]arr.each { |n| puts n }

### Example 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]incremented = arr.map do |n|             n + 1            endp incremented

### Example 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]new_array = arr.map do |n|   n > 1endp new_array

### Example 9

What does the following code return? What does it output? Why? What concept does it demonstrate?

**arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]new_array = arr.map do |n|   n > 1  puts nendp new_array**

### Example 10

What does the following code return? What does it output? Why? What concept does it demonstrate?

a = "hello"[1, 2, 3].map { |num| a }

### Example 11

What does the following code return? What does it output? Why? What concept does it demonstrate?

[1, 2, 3].each do |num|  puts numend

### Other Collection Methods

[Link to all examples below](https://launchschool.com/lessons/85376b6d/assignments/d86be6b5)

### Example 1

[1, 2, 3].any? do |num|  num > 2 end

### Example 2

{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|  value.size > 4end

### Example 3

[1, 2, 3].all? do |num|  num > 2end

### Example 4

{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|  value.length >= 3end

### Example 5

[1, 2, 3].each_with_index do |num, index|  puts "The index of #{num} is #{index}."end

### Example 6

{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|  array << pair.lastend

### Example 7

{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|  hash[value] = keyend

### Example 8

odd, even = [1, 2, 3].partition do |num|  num.odd?endp odd p even