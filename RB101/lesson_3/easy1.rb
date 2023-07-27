# question 1
# numbers = [1, 2, 2, 3]
# numbers.uniq

# puts numbers
# # expect [1,2,2,3]

# question 2
# 1. what is != and where should you use it? # when evaluating if two operands are not equal to each other.
# 2. put ! before something, like !user_name # returns false if truthy value or true if falsy
# 3. put ! after something, like words.uniq! # indicates it mutuates the caller.
# 4. put ? before something # throw error.
# 5. put ? after something # ternary operator
# 6. put !! before something, like !!user_name # converts user_name into a strict true value.

# question 3
# advice = "Few things in life are as important as house training your pet dinosaur."
# advice.gsub!('important', 'urgent')
# puts advice

# question 4
# numbers = [1, 2, 3, 4, 5]

# p numbers.delete_at(1)
# p numbers.delete(1)

# question 5
# Programmatically determine if 42 lies between 10 and 100.
# hint: Use Ruby's range object in your solution.
# puts (10..100).include?(42)
# puts (10..100).cover?(42)
# p (10..100)

# question 6
# famous_words = "seven years ago..."
# words_in_front = "Four score and "

# puts words_in_front + famous_words
# # puts words_in_front << famous_words
# puts famous_words.prepend(words_in_front)

# question 7
# flintstones = ["Fred", "Wilma"]
# flintstones << ["Barney", "Betty"]
# flintstones << ["BamBam", "Pebbles"]

# p flintstones.flatten(-1)

# question 8
# flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, Betty: 3, "BamBam" => 4, "Pebbles" => 5 }

# p flintstones.to_a[2]