Practice Problem 1
What is the return value of the select method below? Why?

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```
The return value of the above code is the array `[1, 2, 3]`. This is because the select method considers the return value of the block. The last line evaluated in the block is the string `'hi'` which has a truthy value. When the return value of the block in that iteration is truthy, the value passed to the block as an argument will be selected. That's why every element in the original array is included in the array returned by the `select` method call. 

Practice Problem 2
How does count treat the block's return value? How can we find out?

```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```
The `count` method call considers the return value of the block. If the return value of the block is truthy, the return value of the `count` method call is incremented by 1. We can find out by looking at the documentation or running the code.  

Practice Problem 3
What is the return value of reject in the following code? Why?

```ruby
[1, 2, 3].reject do |num|
  puts num
end
```
The `reject` method call considers the return value of the block. The `reject` method calls the block with each element and returns a new array with elements for which the block returns a falsy value. The return value for the block will always be `nil` since the `puts` method call will always return `nil`. This is why it will output `[1, 2, 3]`. 

Practice Problem 4
What is the return value of each_with_object in the following code? Why?

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```
The `each_with_object` method calls the block with each element and returns the object that was passed as an argument. Each time the block is called a key value pair is added/mutated to the `{}` object. The first letter of the each element is used as the key and the whole string value as the value. The above code returns `{'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}`

Practice Problem 7
What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```
The `any?` method calls the block with each element and returns true if any block calls returns a truthy value. The above code will return `true` as `1` and `3` are odd. The above code will output `1` and return `true`. It does not do further evaluations as ruby knows the `any?` method call wil now return `true`. This demonstrates short-circuiting behaviour of ruby.

Practice Problem 9
What is the return value of map in the following code? Why?

```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```
The `map` method with each key-value pair calls the block and returns a new array. The new array will be populated with the return value of each block call. The above code will return `[nil, 'bear']`. This is because the value of the first key-value pair is not greater than 3. When none of the `if` statement conditions evaluate to true, the `if` statement itself returns `nil`. 

Practice Problem 10
What is the return value of the following code? Why?

```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```
The `map` method with each element calls the block and returns a new array. The new array is populated with the return value of each block call. The return value is `[1, nil, nil]` as the `puts` method is last line evaluated when the value of `num` block parameter variable is greater than `1`.  