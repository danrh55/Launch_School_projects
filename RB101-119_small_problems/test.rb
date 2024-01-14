# p format('(%d) %d-%d', 403, 402, 1719)
# p sprintf('%-d', 100) # => "+64"

# # Further Exploration
# WORDS = %w(zero one two three four five six seven eight nine)
# DIGITS = ('0'..'9')

# WORD_TO_DIGIT = WORDS.zip(DIGITS).to_h

# def word_to_digit2(words)
#   number_word_matches = 'zero|one|two|three|four|five|six|seven|eight|nine'
#   matching_regex = /\b('zero|one|two|three|four|five|six|seven|eight|nine'})\b (\s(?=('zero|one|two|three|four|five|six|seven|eight|nine'})))*/xi

#   words.gsub!(matching_regex) do |number_word_match|
#     WORD_TO_DIGIT[number_word_match.downcase.strip]
#   end
#   words.gsub!(/(\d{3})(\d{3})(\d{3})/, '(\1) \2-\3') # formatting for phone numbers

#   words
# end


# puts word_to_digit2('Please call me at four one six five five five one two three four between ' \
#                     'eight AM and six PM. Thanks.') == 'Please call me at (416) 555-1234 between 8 AM and 6 PM. Thanks.'

# puts word_to_digit2('Please call me at FIVE FIVE FIVE One two three Four five six seven. ' \
#                     'Thanks, Agent 5 2 0') == 'Please call me at (555) 123-4567. Thanks, Agent 5 2 0'
# puts word_to_digit2('one Two THree FOUr FIVE SIX sEVEN eiGHT ninE zero hi zero hi one two three 1 2 3') ==
#      '(123) 456-7890 hi 0 hi 123 1 2 3'
# puts word_to_digit2('Please call me at four one six five five five one two three four between ' \
#                     'eight AM and six PM. Take none of the freight eighty. Thanks.') ==
#      'Please call me at (416) 555-1234 between 8 AM and 6 PM. Take none of the freight eighty. Thanks.'

string = IO.read('example.txt')
sentences = string.split(/(?<![\.]\w)[\.!?]\s\W/).map {|sentence| sentence.strip}
longest = ['', 0]
sentences.each do |sentence|
  if sentence.split(' ').size > longest[1]
    longest[0] = sentence
    longest[1] = sentence.split(' ').size
  end
end
p longest