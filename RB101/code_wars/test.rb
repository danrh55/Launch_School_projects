NUMERALS = { M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90,
  L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1 }

def solution(number)
  return '' if number <= 0
  NUMERALS.each do |key, val|
    return key.to_s + solution(number - val) if number >= val
  end 
end

# def solution(number)
#   roman_equiv = { 1000 => 'M', 2000 => 'MM', 3000 => 'MMM', 
#     100 => 'C' , 200 => 'CC', 300 =>'CCC', 
#     400 => 'CD', 500 => 'D', 600 => 'DC', 
#     700 => 'DCC', 800 => 'DCCC', 900 => 'CM',
#     10 => 'X', 20 => 'XX', 30 => 'XXX',
#     40 => 'XL', 50 => 'L', 60 => 'LX', 
#     70 => 'LXX', 80 => 'LXXX', 90 => 'XC', 
#     1 => 'I', 2 => 'II', 3 => 'III',
#     4 => 'IV', 5 => 'V', 6 => 'VI', 
#     7 => 'VII', 8 => 'VIII', 9 => 'IX' }
#   num_digits = { 4 => 1000, 3 => 100, 2 => 10, 1 => 1}

#   num_str_arr = number.to_s.split('') # e.g. 1234 => %w(1 2 3 4)
#   roman_str = ''
#   digit_place = num_str_arr.size 

#   num_str_arr.each do |num|
#     num_place = (num.to_i * num_digits[digit_place])
#     roman_str << roman_equiv[num_place] if num.to_i != 0
#     digit_place -= 1
#   end
#   roman_str
# end

NUMERALS = { 1000=>'M', 500=>'D', 100=>'C', 50=>'L', 10=>'X', 5=>'V', 1=>'I' }

def solution(number)
  roman_str = ''
  NUMERALS.each do |key, value|
    if number > key
      roman_str << value 
      number -= key
    else
      roman_str << value
    end
  end
end 

p solution(1666)


