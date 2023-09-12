1. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def cap(str)
  str.capitalize! # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name
```

2. What does the following code return? What does it output? Why? What concept does it demonstrate?

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

3. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
```
What are a, b, and c? What if the last line was `c = a.uniq!`?

4. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value = value.upcase  
  value.concat('!')
end

s = 'hello'
t = fix(s)
```
What values do `s` and `t` have? Why?

5. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = "Hello"
if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```
6. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
incremented = arr.map do |n|
  n + 1
end
p incremented
```

7. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hi there"
b = a
a = "not here"
```
What are a and b?

8. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.select { |n| n.odd? }
```

9. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
```
10. What does the following code return? What does it output? Why? What concept does it demonstrate?
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
11. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr
num = 3
num = 2 * num
```