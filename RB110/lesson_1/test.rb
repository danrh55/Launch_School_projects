arr = (1..5).to_a

x=arr.select.with_index do |num, index|
  arr[index] = 'hello'
  num == 'hello'
end

p x
p arr
