def rotate_array(arr)
  new_arr = []
  arr.each_index do |index|
    next if index == 0
    new_arr.push(arr[index])
  end

  new_arr.push(arr[0])
end

def rotate_rightmost_digits(num, n)
  num_to_str = num.to_s
  front_digits = num_to_str[0..(num_to_str.size - (n+1))]
  back_digits = num_to_str[-n..-1]
  back_digits = rotate_array(back_digits.split('')).join('')
  (front_digits + back_digits).to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917