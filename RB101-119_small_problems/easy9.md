Welcome Stranger
Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

Example:

```ruby
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> "Hello, John Q Doe! Nice to have a Master Plumber around."
```

```ruby
def greetings(arr, hash)
  name = arr.join(' ')
  puts "Hello #{name}! Nice to have a #{hash[:title]} #{hash[:occupation]} around"
end
```
Double Doubles
A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

Examples:

```ruby
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
```
Note: underscores are used for clarity above. Ruby lets you use underscores when writing long numbers; however, it does not print the underscores when printing long numbers. Don't be alarmed if you don't see the underscores when running your tests.

notes:
- convert to string and convert back to compare
- odd number of digits will never be a double number

implicit: 
- single digits are never double numbers

algo:
if the number of digits is odd return the integer multiplied by 2
else 
  grab the number of digits of the integer
  convert integer to string compare the sliced first half converted to integer equals the same operation using second half. 
  return the original integer value if true
  else return integer * 2 

```ruby
def twice(int)
  return int * 2 if int.digits.size.odd?

  str_int = int.to_s
  num_digits = int.digits.size

  if str_int.slice(0, (num_digits/2)).to_i == str_int.slice(num_digits/2, num_digits/2).to_i
    int
  else
    int * 2
  end
end
```
Counting Up
Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

Examples:

Copy Code
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

How long are you?
Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

Examples

```ruby
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []
```

Group Anagrams
Given the array...

```ruby
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
          
<!-- Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this: -->

# output
# ["demo", "dome", "mode"]
# ["neon", "none"]
#(etc)
```
implicit:
- separate arrays for each group of anagrams

notes:
- convert each word into a array of characters, then sort, 
