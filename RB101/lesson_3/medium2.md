# Question 1
Every object in Ruby has access to a method called object_id, which returns a numerical value that uniquely identifies the object. This method can be used to determine whether two variables are pointing to the same object.

Take a look at the following code and predict the output:

```ruby
a = "forty two"
b = "forty two"
c = a

puts a.object_id 
puts b.object_id # different output from a.object_id
puts c.object_id # same output as a.object_id
```
# Question 2
Let's take a look at another example with a small difference in the code:

```ruby
a = 42
b = 42
c = a

puts a.object_id 
puts b.object_id
puts c.object_id
```
They all have the same object_id as an integer is an immutable object. Whenever you assign an immutable value to a variable multiple time, the new variable store the reference value of the object already existing in memory. 

# Question 3
Let's call a method, pass two strings as arguments and see how they can be treated differently depending on the method invoked on them inside the method definition.

Study the following code and state what will be displayed...and why:

```ruby
def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga"
  string_param_two << "rutabaga"
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}" # outputs pumpkins
puts "String_arg_two looks like this now: #{string_arg_two}" # outputs pumpkinsrutabaga
```
The value assigned to the `string_arg_two` local variable is mutated as a mutating method acts on the value. 

# Question 4
To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the user's version of it.

```ruby
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```
The `tricky_method_two` method is invoked on line 60. It passes the value of the local variables `my_string` and `my_array` as arguments. The method defintion of the `tricky_method_two` method takes in two parameters. The parameters receive a copy of the reference value stored in the variables `my_string` and `my_array`. The parameter variables point to the same object as its respective arguments. The value of the `a_string_param` variable is mutated to `pumpkinsrutabaga`. The parameter variable `an_array_param` is reassigned the array `['pumpkins', 'rutabaga']`. The method returns the value held in the `an_array_param` variable.

The first puts method invocation outputs `'pumpkinsrutabaga'`
The second puts method invocation outputs `['pumpkins']` as the `tricky_method_two` method invocation did not mutate the original array object.

# Question 5
Depending on a method to modify its arguments can be tricky:

```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```
Whether the above "coincidentally" does what we think we wanted depends upon what is going on inside the method.

How can we change this code to make the result easier to predict and easier for the next programmer to maintain? That is, the resulting method should not mutate either argument, but my_string should be set to 'pumpkinsrutabaga' and my_array should be set to ['pumpkins', 'rutabaga']

```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```
# Question 6
How could the following method be simplified without changing its return value?

```ruby
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
```

```ruby
def color_valid(color)
  color == "blue" || color == "green"
end
```