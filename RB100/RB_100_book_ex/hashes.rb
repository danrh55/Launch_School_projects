# family = {  uncles: ["bob", "joe", "steve"],
#   sisters: ["jane", "jill", "beth"],
#   brothers: ["frank","rob","david"],
#   aunts: ["mary","sally","susan"]
# }

# siblings = family.select do |key, value|
#   key == :sisters || key == :brothers
# end

# puts siblings

# my_info = {age: 28, height: 178}
# my_info_2 = {age: 40, weight: 80, country: 'bla'}

# merge = my_info.merge(my_info_2)
# puts my_info, my_info_2, merge

# my_info = {age: 28, height: 178}
# my_info_2 = {age: 40, weight: 80, country: 'bla'}

# merge = my_info.merge!(my_info_2)
# puts my_info, my_info_2, merge

# family = {  uncles: ["bob", "joe", "steve"],
#   sisters: ["jane", "jill", "beth"],
#   brothers: ["frank","rob","david"],
#   aunts: ["mary","sally","susan"]
# }

# family.each_key do |key|
#   puts key
# end

# family.each_value do |val|
#   puts val
# end

# family.each do |key, val|
#   puts "#{key}: #{val}"
# end

# person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
# person[:name]

person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

person.each_value do |value|
  if value.downcase == 'bob'
    puts "The value is in hash"
  end
end
