# # Given 2 two arguments of an array of numbers and a number, 
#find all the pairs that results in the forming a triangle with the number.  - Eric

#  Note: To determine if three numbers form a triangle you have touse the Triangle Inequality Theorem, 
#which states that the sum of two side lengths of a triangle is always greater than the third side. 
#If this is true for all three combinations of added side lengths, then you will have a triangle.

# Test cases
=begin
puts find_triangle_pairs([2, 3, 4, 5], 7).inspect # [ [ 3, 5 ], [ 4, 5 ] ]
puts find_triangle_pairs([1, 2, 3, 4], 10).inspect # []
puts find_triangle_pairs([7, 10, 12, 15], 9).inspect # [ [ 7, 10 ], [ 7, 12 ], [ 7, 15 ], [ 10, 12 ], [ 10, 15 ], [ 12, 15 ] ]
puts find_triangle_pairs([8, 2, 5, 6, 3], 4).inspect # [ [ 8, 5 ], [ 8, 6 ], [ 2, 5 ], [ 2, 3 ], [ 5, 6 ], [ 5, 3 ], [ 6, 3 ] ]


P:
input: array and integer
output: nested array of pairs

conditions:
- get all combination of pairs
- check if all combination of the three numbers matches triangle inequality theorem
what will be true:
- the thir comparison number will always be the same

implicit:
- return empty array if no match. 

D:
array

A:
initalize triangle pairs array  = []

get_all_combinations method

iterate through each element with index
  iterate through the index + 1 value element until the last element
    push each pair to the triangle pairs array
  return the unique triangle pairs array

triangle? method


=end

def all_comb(arr)
  triangle_pairs = []
  arr.each_with_index do |ele, index|
    arr[index+1..-1].each do |ele2|
      triangle_pairs = triangle_pairs.push([ele, ele2])
    end
  end
  triangle_pairs.uniq
end

def triangle?(pair, num)
  pair.sum > num
end

def find_triangle_pairs(arr, num)
  all_comb = all_comb(arr)
  
  all_comb.select do |pair|
    pair if triangle?(pair, num)
  end
end

puts find_triangle_pairs([2, 3, 4, 5], 7).inspect # [ [ 3, 5 ], [ 4, 5 ] ]
puts find_triangle_pairs([1, 2, 3, 4], 10).inspect # []
puts find_triangle_pairs([7, 10, 12, 15], 9).inspect # [ [ 7, 10 ], [ 7, 12 ], [ 7, 15 ], [ 10, 12 ], [ 10, 15 ], [ 12, 15 ] ]
puts find_triangle_pairs([8, 2, 5, 6, 3], 4).inspect # [ [ 8, 5 ], [ 8, 6 ], [ 2, 5 ], [ 2, 3 ], [ 5, 6 ], [ 5, 3 ], [ 6, 3 ] ]

def find_triangle_pairs(numbers, fixed_number)
  valid_pairs = []

  # Helper function to check if three sides can form a triangle
  def can_form_triangle(a, b, c)
    a + b > c && a + c > b && b + c > a
  end

  # Iterate through the array to check each pair with the fixed number
  numbers.combination(2).each do |pair|
    if can_form_triangle(pair[0], pair[1], fixed_number)
      valid_pairs.push(pair)
    end
  end

  valid_pairs
end
