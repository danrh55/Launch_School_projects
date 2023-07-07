# def check_array(n, arr)
#   arr.include?(n)
# end

# arr = [1, 3, 5, 7, 9, 11]
# number = 3

# puts check_array(number, arr)

# arr = [["test", "hello", "world"],["example", "mem"]]

# puts arr[1][0]

# arr = ["my", "name", "is", "Eric", "Cho"]

# arr.each_with_index do |element, index| 
#   puts "#{element} is in index #{index}"
# end

arr1 = [1,2,3,4,5]

arr2 = arr1.map do |element|
  element+2
end

p arr1, arr2
