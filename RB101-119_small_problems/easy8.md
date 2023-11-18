Sum of Sums
Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

Examples:

```ruby
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35
```

```ruby
def sum_of_sums(arr)
  sum = 0
  arr.map {|num| sum += num}.sum
end
```

Leading Substrings
Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

Examples:

```ruby
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
```

implicit:
- single string with no whitespace?

```ruby
def leading_substrings(str)
  sub_str_arr = []

  str.length.times {|count| sub_str_arr.push(str.slice(0, count+1)) }
  p sub_str_arr
end
```
All Substrings
Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the previous exercise:

Examples:

```ruby
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

def substrings(str)
  new_arr = []

  str.chars.each_with_index do |char, index|
    new_arr += leading_substrings(str[index..-1])
  end
  
  new_arr
end
```

Palindromic Substrings
Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

Examples:

```ruby
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
```

implicit:
- no white space
explicit:
- case sensitive
- single characters not a palidrome

```ruby
def palindromes(str)
  p substrings(str).select {|substring| substring == substring.reverse && substring.length > 1}
end
```

fizzbuzz
Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers from the starting number to the ending number, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

Example:

```ruby
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
```

implicit
- negative numbers?


```ruby
def fizzbuzz(num_start, num_end)
  num_start.upto(num_end) do |num|
    if (num % 3 == 0) && (num % 5 == 0)
      puts 'FizzBuzz'
    elsif (num % 3 == 0)
      puts 'Fizz'
    elsif (num % 5 == 0)
      puts 'Buzz'
    else
      puts num
    end
  end
end
```

Double Char (Part 1)
Write a method that takes a string, and returns a new string in which every character is doubled.

Examples:

```ruby
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''
```

```ruby
def repeater(str)
  str.chars.map {|chr| chr*2}.join('')
end
```

Double Char (Part 2)
Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

Examples:

```ruby
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
```
```ruby
def double_consonants(str)
  str.chars.map do |chr|
    if chr =~ /[aeiou\d\W\s_]/
      chr
    else
      chr * 2
    end
  end.join('')
end
```

Reverse It (Part 1)
Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

Examples:

```ruby
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
```
The tests above should print true.

```ruby
def reverse_sentence(str)
  str = str.strip

  p str.split.reverse.join(' ')
end
```

Reverse It (Part 2)
Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

Examples:

```ruby
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
```

```ruby
def reverse_words(str)
  str.split(' ').map {|word| word.length >= 5 ? word.reverse : word}.join(' ')
end
```
Array Average
Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

Don't use the Array#sum method for your solution - see if you can solve this problem using iteration more directly.

Examples:

```ruby
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
```
The tests above should print true.

```ruby
def average(arr)
  arr.reduce(:+)/arr.size
end
```
