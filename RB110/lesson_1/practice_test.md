Q1. Explain the code below and the concept it demonstrates. 

```ruby
(1..5).inject(:*)
```
The range `1..5` calls the inject method. The argument passed in is a symbol `:*`. Since there is no starting sum value given, it takes the first element in range `1` as the value of sum. The `:*` argument tell the inject method to use the sum value and the current element as operands and combine the sum value with the resulting evaluation. This repeats for all the elements in the range object. This method is useful because it allows us to not define a new variable to combine a series of values. 

Q2. Why doesn't the below code does not behave as expected?

```ruby
arr = (1..10)

arr.each_with_index do |num, index|
  arr.pop(num) if index.even?
end
```
This does not work as expected due to the nature of the iteration method. The iterator method `each_with_index` iterates through based on index value and increments the index value each time. It does not consider the change in the array size of the array assigned to `arr`. In this case the mutation of the original array won't affect the iteration process however it is generally not a good idea to mutate the iterand as it can behave unexpectedly. It is not affected in this case as the iteration on the odd number is skipped. 

Q3. Why doesn't the below code below don't behave as expected and what concept that this demonstrate?

```ruby
arr1 = %w(hello world, my name is Eric)

arr2 = arr1.clone
arr2.push('element1')

arr3 = arr1.dup
arr3.unshift('element2')

arr1.each do |word|
  puts word.capitalize!
end

p arr1
p arr2
p arr3
```
The `capitalize!` method call mutatates the string values within the array assigned to variable `arr1`. This mutation affects the arrays assigned to variable `arr2` and `arr3` due to the `clone` and `dup` method only create a copy of the array object itself while the elements assigned to each index is shared. This results in the elements inside the arrays assigned to `arr2` and `arr3` are capitalized except the element pushed and appended to the new arrays. This demonstrates the fact that variables hold reference values and not the object itself. 

Q4. What will the below code output? Why? What concept does it demonstrate?

```ruby
arr = (1..5).to_a

p arr.select.with_index do |num, index|
  arr[index] += 1 if num.odd?
  num.even?
end
```
The array assigned to variable `arr` calls the `select.with_index` method and passes its element and index as an argument to the block as parameters. The index value of the array assigned to the `arr` variable is mutated but the object itself at the index is not mutated. The mutation occurs at the array level and not the element level. This means that the `num` variable points to the original object while the array index points to a different value. This is why the above does not behave as expected.


Q5. Why doesn't the below code output 'Hallo'? Explain why. 

```ruby
x = 'hello'

x[1] = 'a'

puts x

```
This is because the `x[1]` returns a new string instead of mutating the originial string object. Strings may look like they behave like an array of strings but they are separate objects. 

Q6. What is the output? why? 

```ruby

x = ('a'..'z').to_a

val = 1

y = x.each_with_object([]) do |chr, arr|
  arr.push(chr)
end

y[1] = '!'
y[2] << 'h'

p x
p y
```
The `y[1]` reassings the element assigned to the `1` index of the array assigned to variable `y`. While `y[2]` is simply mutating the original string by appending `'h'` to it.



1. Examine the code below. Given that loop in this context is a method invocation, what structure does do..end define? Explain with reference to this structure why line 9, puts num, outputs 3 but line 10, puts size, raises an exception. What underlying principle about the structure does this demonstrate?

```ruby
num = 1

loop do
  num = 3
  size = "medium"
  break
end

puts num
puts size # => NameError: undefined local variable or method `size' for main:Object
```
The structure `do..end` alongside a method definition defines a block. The value assigned to variable `num` is reassigned on line 9, therefore the `puts num` outputs 3. The `puts size` method invocation raises an exception as the value assigned to variable `size` is not visible outside the block. The `size variable` was initialized inside the array and not accessible in the outer scope. The `num` variable is accessible as it was initially initalized outside the block. 

This demonstrates the concept of block scoping rules in ruby, specifically that inner scope has access to variables defined in the outer scope, while the reverse is not true. 

2. Suppose you can only see the code shown below, but there is a lot of code above the snippet. What are the possible outcomes of the call to #puts on line 8? Explain why each of these outcomes would occur.

```ruby
# .. lots of code up here omitted

loop do
  my_pets = ['kitten', 'puppy', 'bird']
  break
end

puts my_pets
```
There are three possible outcomes

if the `my_pets` variable was not initalized outside the block, it will throw a name error as any variables initialized in a block is not visible in the outer scope.

if the `my_pets` variable is initialized outside, it will be reassigned to the array given above. This will result in the string elements in the array being displayed on separate lines.

the `my_pets` may be a method invocation with no arguments. It will return some value and that value will be passed as an argument to the `puts` method call and will be displayed. 

3. We'd like the code to output what's shown, but it's not currently working. What do we get instead, and why? Fix the example by adding code on line 3. Explain why your solution works. What concept does this demonstrate?​

Expected Output

C
H
E
S
S
S

```ruby
str = "chess"

# Can add code here
upcased_letter = ''

index = 0
loop do
  puts (str[index].upcase)
  upcased_letter = str[index].upcase
  index += 1
  break if (str.size) == index
end

puts upcased_letter
```
The name error thrown is due to the value of variable `upcased_letter` is not visible outside the block scope. This is because it is being initialized in the block. You have to initialize the variable outside the block first in order for the variable to be visible outside the scope of the block. 

This demonstrates the concept of variable scoping rules in regards to blocks.

4. Explain why the method invocation make_a_question on line 7 of the code below raises an exception rather than outputting the String How are you?. What is the structure defined on lines 3 to 5? What underlying principle does this example illustrate with regards to this structure and its relationship to line 1?

```ruby
question = "How are you"

def make_a_question
  puts question + "?"
end

make_a_question
# NameError: undefined local variable or method `question' for main:Object
```
The method invocation `make_a_question` throws an error because the value of the variable `question` isn't accessible within the scope of the method. This demonstrates the concept of variable scoping rules in regards to method invocations. The object must be passed in to the method in order for it to be accessible.

5. Matt wants to convert his height in inches to centimeters. He knows that 1 inch is equal to 2.54 centimeters. He also knows that he is 67 inches tall. However, the method he wrote doesn't work as expected. He expected to get 170.18 as the result, but instead he got 67. What is wrong with the code? Explain the output and fix the code so that it works as expected without removing anything from the current implementation.

```ruby
INCH_TO_CM = 2.54

matthew_height = 67

def convert_inches_to_cm(height)
  matthew_height = height * INCH_TO_CM
end

convert_inches_to_cm(matthew_height)

p matthew_height
```
The code does not work as intended as the original object is not mutated. The `matthew_height` variable within the method is considered a separate variable by ruby and therefore the reassignment isn't visible outside the scope of the method. You should reassign the `matthew_height` variable to the return value of the method to make it work correctly.

6. Explain why the line puts animal outputs dog rather than cat. What relationship, if any, is there between the occurrences of the word animal on lines 1, 3 and 4 and what specific principle does this demonstrate? When dealing with situations where this particular principle might have an impact, what can be done to avoid this type of issue?

```ruby
animal = "dog"

1.times do |animal|
  animal = "cat"
end

puts animal
```
The variable `animal` is used as a block parameter and therfore it shadows the `animal` variable initalized outside the block. Therefore the reassignment of the `animal` variable within the block to the string `'cat'` isn't visible outside the block. Therefore the `puts` method call outputs `'dog'`. To avoid this situation, it would be best to use a unique variable name for the block parameter.  

7. Within the context of the entire code example, what is the relationship between the variable word initialized on line 5 and the parameter str defined on line 1?

On line 2, what is the relationship between the str to the left of the << and the str to the right of it? In the context of this relationship, explain why line 8 in the below code prints hellohello rather than hello. What concept does this demonstrate?

```ruby
def repeat(str)
  str << str
end

word = "hello"
repeat(word)

puts word
```
The string value assigned to `str` is being appended by its own value. The `<<` method mutates the original string and therefore the `puts` method call outputs `'hellohello'`. This demonstrates the concept of mutability. The original string object `'hello'` is passed as an argument and is assigned to the parameter variable `str`. At this point variable `word` and `str` point to the same string object. And since the value assigned to variable `str` is mutated, the value assigned to variable `word` is also affected. 

8. We've modified the repeat method slightly. Why does line 9 print hello rather than hellohello? What's happening on line 2, and why did adding this line so dramatically affect the final output? Be very precise with how you explain what's happening here.

```ruby
def repeat(str)
  str = 'hello'
  str << str
end

word = "hello"
repeat(word)

puts word
```
This is because the reassignment of the variable `str` on line 9 cause the object pointed to by the variable `word` and `str` to differ. When the value of variable `str` is mutated, it is mutating a differing object than the object assigned to the `word` variable. The `'hello'` string object on line 9 is a different object than the `'hello'` object initialized on line x. 
 
9. We've modified the repeat method again. Why does line 9 print hello rather than HELLOHELLO? What's happening on line 2, and why did calling the mutating upcase! method on line 3 not have any effect on the final output? What concept does this demonstrate? Be very precise with how you explain what's happening here.

```ruby
def repeat(str)
  str += str
  str.upcase!
end

word = "hello"
repeat(word)

puts word
```
This is similar to the previous question. The `str` parameter variable is reassigned to the string concatenated by its own value. The concantentation returns a new string object and therefore the variables now point to different objects. This demonstrates the concept of variables as pointers/reference value. 

10. The last line of both examples below outputs shhhshhh. Explain as precisely as you can the difference between these pieces of code.

```ruby
# Example 1:
def double_quiet(string)
  string << string
  string.downcase!
end

instruction = "SHHH"
double_quiet(instruction)

puts instruction

# Example 2:
def double_quiet(string)
  string += string
  string.downcase
end

instruction = "SHHH"
instruction = double_quiet(instruction)

puts instruction
```
The difference lies in whether the original string object was mutated or not. The first example mutates the original string and therefore no reassignment is needed to output the string `'shhhshhh`. The second example reassigns the `string` parameter variable and returns a new object which is `'shhhshhh'` The `instruction` variable still points to the string `'SHHH'` after the method executes but is reassigned ther return value of the method to the string value we want.

11. Brandon has just started learning Ruby and wants to implement #funny_string method which changes the string so its second character is uppercased. However, the code doesn't work as expected. Why is the output on line8 "school" when mutating upcase! method is invoked ? What concept does this illustrate?

```ruby
def funny_string(string)
  string[1].upcase!
end

my_str = "school"
funny_string(my_str)

p my_str
```
The `string[1]` method call returns a new character object and the `upcase!` method acts on this new object. Therefore it does not affect the original `'school'` string object. This demonstrates the concept that strings are not an array of character objects. 