=begin
https://www.codewars.com/kata/57cfdf34902f6ba3d300001e/train/ruby
You will be given a list of strings. You must sort it alphabetically (case-sensitive, and based on the ASCII values of the chars) 
and then return the first value. The returned value must be a string, and have "***" between each of its letters. You should not remove or add elements from/to the array.

Problem:

Input: array of strings
Output: transformed single string 

Rules:

explicit:
  - return the first value in the sorted string array
  - between each letters add *** 
  - not mutuate the original array
  - sorts based on ASCII values
implicit:
  - string array only contains letters
  - no empty array will be passed
  - no space character inside string

Examples:
two_sort(["bitcoin", "take", "over", "the", "world", "maybe", "who", "knows", "perhaps"]) =='b***i***t***c***o***i***n' 
two_sort(["turns", "out", "random", "test", "cases", "are", "easier", "than", "writing", "out", "basic", "ones"]) =='a***r***e' 
two_sort(["lets", "talk", "about", "javascript", "the", "best", "language"]) =='a***b***o***u***t' 
two_sort(["i", "want", "to", "travel", "the", "world", "writing", "code", "one", "day"]) =='c***o***d***e' 
two_sort(["Lets", "all", "go", "on", "holiday", "somewhere", "very", "cold"]) =='L***e***t***s' 

Data structures:
Input: array of strings
Output: string object
inbetween: ?

notes

Algorithm for my_sort!:
- set the current index = 0
- set the comparison index = 1
- Iterate through each element in array 
  - While the comparison index not equal the length of array
    - if the comparison element has a lower value than the current element
      - store the current element in a new variable called holding_spot
      - set the value of the current index equal to the element in the comparison index
      - set the value of the comparison index to the value in the holding spot
    - increment the comparison index by 1
  - increment the current index by 1
  - set the comparison index equal to the current index + 1
  - return the array

Algorithm for my_sort:
- create a new empty array
- 
- return the new_array
=end

def my_sort!(array)
  current_element_index = 0
  comparison_element_index = 1
  while current_element_index != array.size
    while comparison_element_index != array.size
      if (array[current_element_index] <=> array[comparison_element_index]) == 1
        holding_spot = array[current_element_index]
        array[current_element_index] = array[comparison_element_index]
        array[comparison_element_index] = holding_spot
      end
      comparison_element_index += 1
    end
    current_element_index += 1
    comparison_element_index = current_element_index + 1
  end
  array
end

def my_sort(array)
  new_array = []
  array.each do |current_element|
    comparison_element_index = (array.index(current_element) + 1)
    while comparison_element_index < array.size
      if ((lowest_element_holder <=> array[comparison_element_index]) == 1) && !(new_array.include?(lowest_element_holder))
        lowest_element_holder = array[comparison_element_index]
      end
      comparison_element_index += 1
    end
    # puts lowest_element_holder
    new_array.push(lowest_element_holder) unless new_array.include?(lowest_element_holder)
  end
  new_array
end

array = ["Lets", "all", "go", "on", "holiday", "somewhere", "very", "cold"]

# p my_sort!(array)
# p array.sort
# p array

p my_sort(array)
p array.sort
p array
