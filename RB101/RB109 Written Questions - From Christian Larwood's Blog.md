### Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "Hello"
b = a
a = "Goodbye"

puts a
puts b
```
The string `Hello` is assigned to the local variable on line 6. The value of variable `a` is assigned to the local variable `b`. The variable `a` is reassigned the string `Goodbye`. 

The `puts` method invoked on line 10 with the value of variable `a` passed as an argument. It outputs `Goodbye` and returns `nil`.
The `puts` method invoked on line 11 with the value of variable `b` passed as an argument. It outputs `Hello` and returns `nil`.

This demonstrates the concept of object passing/variables as pointers.

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4

loop do  
  a = 5  
  b = 3

  break
end

puts a
puts b
```
The integer `4` is assigned to the local variable `a` on line 25. The `do..end` along with the invocation of the `loop` method creates an inner block scope. The inner scope local variable `a` is reassigned the integer `5` on line 28. The inner scope local variable `b` is assigned to integer `3`. It then breaks out of the loop on line 31. 

The `puts` method invoked on line 34 takes the value of the local variable `a` of the main scope as an argument. It outputs `5` and returns `nil`.
The `puts` method invoked on line 35 passes in the variable `b` as an argument. This will throw an undefined local variable error as the local variable `b` is not defined in the main scope. Specifically, the local variable `b` defined in the block inner scope is not accessible by an outer scope.  

This demonstrates the concept of local variable scoping rules of ruby. Specifically, the concept of an outer scope not having access to its inner scope. 

### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4
b = 2

loop do  
  c = 3  
  a = c  
  break
end

puts a
puts b
```

The integer `4` is assigned to the local variable `a`. The local variable `b` is assigned the value integer `2`. 

The `loop` method is called with a `do..end` block as an argument. The `do..end` along with a method invocation creates a block inner scope. The integer `3` is assigned to the local variable `c` on line 53. The local variable `a` is reassigned the value of variable `c`. 
It breaks out of the loop on line 55. 

The `puts` method invoked on line 58 is passed the value of the variable `a` as an argument. This outputs `3` and returns `nil`
The `puts` method invoked on line 59 is passed the value of the variable `b` as an argument. This outputs `2` and returns `nil`

This demonstrates local variable scoping rules in ruby. Specifically, that local variables initialized outside the block is accessible within the block.

### Example 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def example(str)
  i = 3  
  loop do    
    puts str    
    i -= 1    
    break if i == 0  
  end
end

example('hello')
```
The `example` method definition is defined with a `str` variable as a parameter on line 75.

The `example` method is called on line 84 with string `hello` passed as an argument. The `str` parameter variable is assigned the string value `'hello'`. 

The local variable `i` is assigned the integer `3` on line 3. 
The `loop` method is called with the `do..end` block as an argument. This combination creates a block inner scope. Inside the loop, the  `puts` method is called with the value of the variable `str` as an argument. This outputs `hello` and returns `nil` on line 78. The local variable `i` is reassigned its current value decremented by 1. The inner scope has access to its outer scope. This set of instructions will repeat until the value of variable `i` equals the integer `0`. To summarize, this program will output `hello` three times. 

This demonstrates the concept of local scoping rules in ruby. Specifically, local variables initalized outside the block is accessible within the block.

### Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def greetings(str)  
  puts str  
  puts "Goodbye"
end

word = "Hello"
greetings(word)
```

The `word` local variable is assigned the string `Hello` on line 107. The greeting method is invoked with the value of the `word` variable as an argument. 

The method definition `greetings`'s parameter variable is assigned the value `'Hello'`. Within the method, the `puts` method is called with the value of the parameter variable `str` as an argument and outputs `Hello`. The `puts` method invokation on line 104 outputs `Goodbye` and returns `nil`.

This demonstrates the concept of object passing and local scoping rules in ruby. Specifically, that method definitions have a fully self-enclosed inner scope. It requires object passing to access variable values defined outside the method's scope. 

[Problem link](https://launchschool.com/lessons/a0f3cd44/assignments/9e9e907c)

### Example 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4]
counter = 0
sum = 0

loop do  
  sum += arr[counter]  
  counter += 1  
  break if counter == arr.size
end 

puts "Your total is #{sum}"
```
The local variable `arr` is assigned the array `[1, 2, 3, 4]` on line 124.
The local variable `counter` is assigned the integer `0`.
The local variable `sum` is assigned the integer `0`.

The `loop` method is called with a `do..end` as an argument on line 128. The `do..end` along with the method invocation creates an inner scope. The loop will run the block of code 4 times. Each time, the local variable `sum` is reassigned the return value of the evaluation of it's current value plus the value of the element at the array index equal to the value of the `counter` variable. The `counter` variable is reassigned its current value increment by 1. It will break out of the loop when the value of the `counter` variable equals the size of the array assigned to the variable `arr`, which is 4. 

The `puts` method is called with a string as an argument. Ruby will evaluate the string interpolation and return the string `'Your total is 10'`. It will output `Your total is 10` and return `nil`.

This program demonstrates the concept of local scoping rules. Specifically, a local variable defined outside the block inner scope will be accessible inside the block.

### Example 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 'Bob'

5.times do |x|  
  a = 'Bill'
end

p a
```
The local variable `a` is assigned to the string `Bob` on line 151. The `times` method is called with the integer `5` as the caller and a `do..end` block as an argument. The `times` method calls the block 5 times and assigns an incrementing integer value to the block parameter `x` starting at `0`. The block reassigns the variable `a` with the string `Bill` each iteration. 

The `p` method invokation passes in the value of variable `a` as an argument. IT outputs `Bill` and returns `Bill`. 

This program demonstrates the concept of local scoping rules in ruby. Specifically, a local variable defined outside a block is accessible within the block. 

### Example 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
animal = "dog"

loop do |_|  
  animal = "cat"  
  var = "ball"  
  break
end

puts animal
puts var
```
The local variable `animal` is assigned the string `dog`. The `loop` method is invoked with a `do..end` as an argument. The `loop` method does not pass any argument value each time the block is called. The local variable `animal` is reassigned the string `cat`. The local variable `var` is initialized with the string `ball`. It then breaks out of the loop. 

The `puts` method is called with the value of the `animals` variable as an argument. It outputs `cat` and returns nil.
The `puts` method invocation on line 179 passes the value of the `var` variable as an argument. However, the `var` variable is not accessible within the main scope and therefore ruby throws an unknown variable or method `NameError`.

This demonstrates local scoping rules in ruby. Specifically, that a variable defined within the inner scope is not accessible in the outer scope. 

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
n = 101.times do |n|  
      n = 11 
    end 
puts n
```
### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
animal = "dog"
loop do |animal|  
  animal = "cat"  
  break
end
puts animal
```
### Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hi there"
b = a
a = "not here"
```
What are a and b?

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hi there"
b = a
a << ", Bob"
```
What are a and b?

### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
```
What are a, b, and c? What if the last line was `c = a.uniq!`?

### Example 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def test(b)
  b.map {|letter| "I like the letter: #{letter}"} 
end
a = ['a', 'b', 'c']
test(a)
```
What is `a`? What if we called `map!` instead of `map`?

### Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = 5.2
b = 7.3
a = b
b += 1.1
```
What is `a` and `b`? Why?

### Example 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def test(str)
  str  += '!'
  str.downcase!
end
test_str = 'Written Assessment'
test(test_str)
puts test_str
```

[Link](https://launchschool.com/blog/object-passing-in-ruby) to explanation of examples below

### Example 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def plus(x, y)
  x = x + y
end
a = 3
b = plus(a, 2)
puts a
puts b
```

### Example 8

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def increment(x)
  x << 'b'
end
y = 'a'
increment(y)
puts y
```
### Example 9

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def change_name(name)
  name = 'bob' # does this reassignment change the object outside the method?
end

name = 'jim'change_name(name)
puts name 
```

### Example 10

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def cap(str)
  str.capitalize! # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name
```

### Example 11

What is `arr`? Why? What concept does it demonstrate?

```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr
a[1] = 5 
arr
```

### Example 12

[Link to example](https://launchschool.com/lessons/c53f2250/assignments/1a6a2665)

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|  
  char.upcase
end

puts arr1
puts arr2
```

### Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```

What values do `s` and `t` have? Why?

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value = value.upcase  
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

What values do `s` and `t` have? Why?

### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)  
  value << 'xyz'  
  value = value.upcase  
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

What values do `s` and `t` have? Why?

### Example 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)  
  value = value.upcase!  
  value.concat('!')
end
s = 'hello'
t = fix(s)
```
What values do `s` and `t` have? Why?

### Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value) 
  value[1] = 'x' 
  value
end

s = 'abc'
t = fix(s)
```
What values do `s` and `t` have? Why?

### Example 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def a_method(string)  
  string << ' world'
end
a = 'hello'
a_method(a)
p a
```

### Example 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr
num = 3
num = 2 * num
```

### Example 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = %w(a b c)
a[1] = '-'
p a
```

### Example 9

[Link to page with #9 & #10](https://launchschool.com/lessons/a0f3cd44/assignments/4b1ad598)

```ruby
def add_name(arr, name)  
  arr = arr + [name]
end
names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```
### Example 10

```ruby
def add_name(arr, name)  
  arr = arr << name
end
names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```
### Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
array = [1, 2, 3, 4, 5]
array.select do |num|
  puts num if num.odd?
end
```

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.select { |n| n.odd? }
```

### Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = arr.select do |n|
   n + 1
end
p new_array
```

### Example 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = arr.select do |n|
  n + 1  
  puts n
end
p new_array
```

### Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
words = %w(jump trip laugh run talk)
new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
```
### Example 6

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each { |n| puts n }
```

### Example 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
incremented = arr.map do |n|
  n + 1
end
p incremented
```

### Example 8

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = arr.map do |n|
  n > 1
end
p new_array
```

### Example 9

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = arr.map do |n|
  n > 1  
  puts n
end
p new_array

```

### Example 10

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hello"
[1, 2, 3].map { |num| a }
```
### Example 11

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

[Link to all examples below](https://launchschool.com/lessons/85376b6d/assignments/d86be6b5)

### Example 1

```ruby
[1, 2, 3].any? do |num|
  num > 2
end
```

### Example 2
```ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
```

### Example 3

```ruby
[1, 2, 3].all? do |num|
  num > 2
end

```
### Example 4

```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```

### Example 5
```ruby
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end
```
### Example 6
```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
```

### Example 7
```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|  
  hash[value] = key
end
```

### Example 8

```ruby
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end
p odd
p even
```

### Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = "Hello"
if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```

### Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def test
  puts "written assessment"
end

var = test
if var
  puts "written assessment"
else
  puts "interview"
end
```
