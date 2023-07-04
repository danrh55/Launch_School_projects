car = { 
  type: 'sedan', 
  color: 'blue',
  mileage: 80000,
}
car[:year] = 2003;
car.delete(:mileage)

puts car[:color]

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

numbers.each do |key, value| 
  puts "A #{key} number is #{value}"
end

half_numbers = numbers.map do |key, value|
  value/2
end

puts half_numbers

low_numbers = numbers.select do |key, value|
  value < 25
end
puts low_numbers

nested_hash = {
  car: {
    type: 'sedan',
    color: 'blue',
    year: 2003
  },
  truck: {
    type: 'pickup',
    color: 'red',
    year: 1998
  }
}

puts nested_hash[:truck][:type]


