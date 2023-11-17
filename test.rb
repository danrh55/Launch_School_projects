def count_occurrences(arr)
  arr.each_with_object({}) do |element, hash|
    if hash.key?(element)
      hash[element] += 1
    else
      hash[element] = 1
    end
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

puts count_occurrences(vehicles)