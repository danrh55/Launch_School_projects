# x = { a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
#   p pair
#   array << pair.last
# end
# p x

# y = { a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
#   hash[value] = key
# end
# p y

def random_method(x = 1)
  puts x
end

random_method()