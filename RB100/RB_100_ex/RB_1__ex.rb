pets = ['cat', 'dog', 'fish', 'lizard']
my_pet = pets[2]
puts "I have a pet #{my_pet}!"

pets = ['cat', 'dog', 'fish', 'lizard']
# my_pets = []
# my_pets.push(pets[2], pets[3])
my_pets = pets[2..3]
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"

pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.delete('lizard')
puts "I have a pet #{my_pets[0]}"

pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop
my_pets.push(pets[1])
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}"

colors = ['red', 'yellow', 'purple', 'green']
colors.each do |color|
  puts "I'm the color #{color}!"
end

numbers = [1, 2, 3, 4, 5]
double_numbers = numbers.map {|number| number * 2}
p double_numbers
p numbers

numbers = [5, 9, 21, 26, 39]
divisible_by_three = numbers.select do |number| 
  number % 3 == 0
end
p divisible_by_three

favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
p favorites.flatten
p favorites

array1 = [1, 5, 9]
array2 = [1, 9, 5]
p array1 == array2




