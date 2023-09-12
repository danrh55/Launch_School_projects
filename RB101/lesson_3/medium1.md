# Question 1
Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!

```ruby
10.times { |num| puts "The Flintstones Rock!".prepend(' ' * num) }
```
The integer `10` object calls the `times` method. The `times` method is passed a block as an argument. The `times` method calls the block for 10 iterations and passes in an integer as an argument. The integer passed in as an argument starts at `0` for the first iteration and is incremented by 1 after every iteration.

# Question 2
The result of the following statement will be an error:

```ruby
puts "the value of 40 + 2 is " + (40 + 2)

```
Why is this and what are two possible ways to fix this?

The `puts` method takes in the evaluation of `"the value of 40 + 2 is " + (40 + 2)` as an argument. This evaluation will throw a type error as the `+` method is trying to coerce a an integer object into a string. 

You can fix this in the following ways:
1. you can convert the evaluation of `(40 + 2)` into a string a string by calling the `to_s` method. 
2. you can use string interpolation to insert `(40 + 2)`

# Question 3
Alan wrote the following method, which was intended to show all of the factors of the input number:
```ruby
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
```
Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you make this work without using the begin/end until construct? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

Bonus 1
What is the purpose of the number % divisor == 0 ?

Bonus 2
What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?

```ruby
def factors(number)
  divisor = number
  factors = []
  loop do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
    break if divisor == 0
  end
  factors
end
```
# Question 4
Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to concatenate an element to the buffer?

```ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```
Yes, there is a difference. The `<<` method will mutate the value assigned to the `buffer` variable but the `+` method will return a new object.

# Question 5
Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

```ruby
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```
How would you fix this so that it works?

pass in the value of the limit variable as an argument or initalize the limit variable within the method definition scope.

# Question 6
What is the output of the following code?

```ruby
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```
The local variable `answer` is assigned the integer object `42` on line 109. The `mess_with_it` method is invoked on line 115 and pases in the value assigned to the local variable `answer` as an argument. The method returns an integer value of `50` and is assigned to the local variable `new_answer`. The p method is called with the value of the local variable `answer` minus the integer `8` as an argument, which evaluates to `34`. The program outputs integer `34`. This illustrates the concept that an object in ruby is mutated only when a mutating method acts on the object.

# Question 7
One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```
After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:

```ruby
mess_with_demographics(munsters)
```
Did the family's data get ransacked? Why or why not?

The data got mutated as a mutating method acts on the values. This demonstrates the concept of mutability and how ruby does object passing by reference value, which is it's object id. 

# Question 8
Method calls can take expressions as arguments. Suppose we define a method called rps as follows, which follows the classic rules of rock-paper-scissors game: it returns the winning fist or, in the case of a tie, the fist that both players played.

```ruby
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
```
What is the result of the following call?
```ruby
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
```
The puts method is called with the return value of the outermost rps method as an argument. It will output `'paper'` to the terminal. 

# Question 9
Consider these two simple methods:

```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```
What would be the return value of the following method invocation?

```ruby
bar(foo)
```
The return value would be `"no"`
