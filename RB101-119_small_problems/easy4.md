1. Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

Examples:

Copy Code
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

Problem:

Input: two strings
Output: single string

Rules:

implicit:
- no space in between
- order of argument strings lengths different.

explicit:
- one string will always be shorter than the other.
- short one, then long, then short again.

Data structures:

no data structure needed:

Algorithm:

If the first string length is greater than the second string
  - return str2 + str1 + str2
else
  return str1 + str2 + str1

Code:

```ruby
def short_long_short(str1, str2)
  if str1.length > str2.length
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end
```

explain: