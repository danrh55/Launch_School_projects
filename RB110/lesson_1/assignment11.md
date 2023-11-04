Practice Problem 1
Given the array below

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
```
Turn this array into a hash where the names are the keys and the values are the positions in the array.

```ruby
index = 0
hash = {}

flintstones.each do |name|
  hash[name] = index
  index += 1
end
```

Practice Problem 2
Add up all of the ages from the Munster family hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

```ruby
combined_age = 0

ages.each do |_name, age|
  combined_age += age 
end

ages.values.inject(:+)
```
Practice Problem 3
In the ages hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```
remove people with age 100 and greater.

```ruby
# ages.each do |key, value|
#   if value >= 100
#     ages.delete(key)

ages.select! { |_name, age| age < 100 } 
```
# you don't have to mutate the object that you are iterating through but you can use return value of the block as the consideration for mutating the object afterwards. 

Practice Problem 4
Pick out the minimum age from our current Munster family hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min
```

Practice Problem 5
In the array:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```
Find the index of the first name that starts with "Be"

```ruby
flintstones.index {|name| name.starts_with?('Be')}
```

Practice Problem 6
Write code that changes the array below so that all of the names are shortened to just the first three characters. Do not create a new array.

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```
```ruby
flintstones.map! {|name| name.slice(0,3)}
```
Practice Problem 7
Create a hash that expresses the frequency with which each letter occurs in this string:

```ruby
statement = "The Flintstones Rock"
```
ex:
```ruby
{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
```

```ruby
hash = {}
statement.chars.each do |letter|
  if hash.key?(letter)
    hash[letter] += 1
  else
    hash[letter] = 1
  end
end
```

Practice Problem 8
What happens when we modify an array while we are iterating over it? What would be output by this code?

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
```
What would be output by this code?

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
```
Practice Problem 9
As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

```ruby
words = "the flintstones rock"

```
would be:
```ruby
words = "The Flintstones Rock"
```
Write your own version of the rails titleize implementation.

```ruby
def titleize(str)
  str.split(' ').map {|word| word.capitalize}.join(' ')
end
```

Practice Problem 10
Given the munsters hash below

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```
Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

```ruby
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
```
Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

```ruby
munsters.each_pair do |_name, info|
  if info['age'] >= 65
    info['age_group'] = 'senior'
  elsif (info['age'] <= 64 && info['age'] >= 18)
    info['age_group'] = 'adult'
  else
    info['age_group'] = 'kid'
  end
end
```

input: hash
output: hash

implicit: mutate the original hash
