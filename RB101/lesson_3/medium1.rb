# q1
# flintstones = 'The Flintstones Rock!'
# 10.times do 
#   puts flintstones
#   flintstones.prepend(' ')
# end

# q3
# def factors(number)
#   divisor = number
#   factors = []
#   if number > 0
#     while divisor > 0 
#       factors << number / divisor if number % divisor == 0
#       divisor -= 1
#     end
#   else
#     puts "rescued"
#   end
#   factors
# end

# p factors(6)

# limit = 15

# def fib(first_num, second_num, limit)
#   while first_num + second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end

# result = fib(0, 1, limit)
# puts "result is #{result}"

# q7
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

p mess_with_demographics(munsters)
p munsters