=begin
Write a method that takes an array of consecutive letters as input and returns the missing letter.

p determine_missing_letter(['a','b','c','d','f']) == 'E'
p determine_missing_letter(['o','q','r','s']) == 'P'
p determine_missing_letter(['H','J','K','L']) == 'i'
p determine_missing_letter([]) == []
=end

=begin

PROBLEM
----------------
INPUT: array of strings, empty array
OUTPUT: string (one letter) if there is a missing letter, empty array if not

RULES:

explicit:
- input is an array of consecutive letters

implicit:
- return a uppercase letter if string array given is lowercase, opposite for lowercase string arrays.
- missing letter is only one letter
- if the input is an array of letters, will always have a missing letter

EXAMPLES / MODELLING
----------------
p determine_missing_letter(['a','b','c','d','f']) == 'E'
a b c d   f
a b c d e f
=> e
=> E

p determine_missing_letter(['o','q','r','s']) == 'P'
p determine_missing_letter(['H','J','K','L']) == 'i'
p determine_missing_letter([]) == []

DATA STRUCTURES
----------------
- Goal: begin to think logically about the problem
  - What data structures could we use to solve this problem?
    - What does our data look like when we get it? (input)
    - What does our data look like when we return it? (output?)
    - What does our data need to look like in the intermediate steps?

- Input: array of strings
- Create: a reference data structure
- inbetween: ?
- Output: string

Array

NOTES
-----
- swapcase?
- range

ALGORITHM
----------------
- If the input array is empty, return an empty array
- Make a reference data structure to compare input to...
  - Create a range where the start is the letter at the first index and the end is the letter at the last index
- Compare input array to reference array
  - For each iteration, check if the current element exists in the input array
    If the current element is missing,
    - Swap the case of the current element for its opposite case
    - Return the string
=end