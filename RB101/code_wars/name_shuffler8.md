Write a function that returns a string in which firstname is swapped with last name.

Example(Input --> Output)
```ruby
"john McClane" --> "McClane john"
```

### Problem

Input: String
Output: String

Rules

Explicit:
- firstname is switched with the last name. 

implicit:
- not capitalize any characters
- the input will always have both a first name and last name only. 

## Examples:

```ruby
p name_shuffler('Eric Cho') == `Cho Eric`
p name_shuffler('Avi Motov') == 'Motov Avi'
p name_shuffler('Polanski') == 'Polanski'
```
## Data structures

input: just a string
output: just a string
in-between: array to split up the string

## Algorithm

- split the string using whitespace as the anchor point and convert it into an array
- reverse the order of the elements held in each array index. 
- convert the array back into a string with whitespace as a seperator.  