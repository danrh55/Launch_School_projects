number_a = 0
number_b = 0

loop do 
  number_a += 1
  number_b += 1
  p number_a
  
  unless number_a == 5 || number_b == 5 
    next
  end
  break
end

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

n = 0

while n < number_of_greetings 
  greeting
  n += 1
end
