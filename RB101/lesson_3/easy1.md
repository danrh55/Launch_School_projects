# Question 1
What would you expect the code below to print out?

```ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```

An array of integers is assigned to the local variable `numbers`. The `uniq` method is invoked with the value of the local variable `numbers` as an argument. The `uniq` method call returns a new array object of unique integers. The puts method is called on line 8 with the value of the local variable `numbers` as an argument. The puts method call outputs to the terminal each integer within the array value assigned to the local variable `numbers` on separate lines and since local variable numbers wasn't mutated it outputs the following.

output:
```ruby
1
2
2
3
```

# Question 2
Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

what is != and where should you use it?
put ! before something, like !user_name
put ! after something, like words.uniq!
put ? before something
put ? after something
put !! before something, like !!user_name

!= is a method call that takes the objects on its left and right as arguments(operands). The method call will return either a `true` or `false` object. It is used to evaluate if the two operands are not equal to each other. 

When ! is before something, it is a method invokation of the ! method, that takes in the value that comes after as an argument and returns either a `true` or `false` object depending on if the passed argument is truthy or falsy. 

When the ! symbol comes after something, it indicates a method call that will mutate the passed argument. 

when the ? symbol comes before something, it indicates a ternary operation. It evaluates the value on its left and returns either the first value if it evaluates to truthy or the second value if it evaluates to falsy.

putting the ? after something indicates a method call that will return either a `true` or `false` object. 

putting !! before something is a sequence of ! method call that takes the object that comes after as an argument. It first takes the object after !! and converts it into either a `true` or `false` object. It then takes that `true` or `false` object as an argument and returns the opposite boolean object. It converts any truthy or falsy into a `true` or `false` object.

# Question 3
Replace the word "important" with "urgent" in this string:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

```ruby
advice.gsub('important', 'urgent')
```

# Question 4
The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

```ruby
numbers = [1, 2, 3, 4, 5]
```
What do the following method calls do (assume we reset numbers to the original array between method calls)?

```ruby
numbers.delete_at(1)
numbers.delete(1)
```
The `delete_at` method is called on the object assigned to the local variable `numbers` and takes in a integer `1` as an argument. Th `delete_at` method mutates the value assigned to the local variable numbers and returns the original object. The array object assigned to the local variable number is now  `[1, 3, 4, 5]`

The local variable `numbers` calls the method `delete` with integer `1` as an argument. The `delete` method mutates the array object assigned to the local variable `numbers` by deleting the integer `1` from the original array. It then returns the original array. The original array is now `[2, 3, 4, 5]`

# Question 5
Programmatically determine if 42 lies between 10 and 100.

hint: Use Ruby's range object in your solution.

```ruby
(10..100).include?(42)
```
# Question 6
Starting with the string:

```ruby
famous_words = "seven years ago..."
```
show two different ways to put the expected "Four score and " in front of it.

```ruby
insert_str = 'Four score and '

puts insert_str + famous_words
puts insert_str << famous_words
```
# Question 7
If we build an array like this:

```ruby
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
```
We will end up with this "nested" array:

```ruby
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
```
Make this into an un-nested array.

```ruby
flintstones.flatten
```
# Question 8
Given the hash below

```ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
```
Create an array containing only two elements: Barney's name and Barney's number.

```ruby
barney_arr = [flintstones.key(2), flintstones['Barney']]
```
