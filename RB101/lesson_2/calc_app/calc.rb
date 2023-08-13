require 'yaml'

MESSAGE = YAML.load_file('message.yml')
OPERATIONS = { 'addition' =>
               { input_variations: %w(1 add addition), symbol: '+' },
               'subtraction' =>
               { input_variations: %w(2 minus subtract subtraction), symbol: '-' },
               'multiplication' =>
               { input_variations: %w(3 multiply multiplication), symbol: '*' },
               'division' =>
               { input_variations: %w(4 divide division), symbol: '/' } }

def prompt(str)
  puts "=> #{str}"
end

def display_msg(msg)
  prompt(MESSAGE[msg])
end

def clean_user_input(user_input)
  user_input.chomp.strip
end

def grab_name
  loop do
    name = clean_user_input(gets)
    if name == ''
      display_msg('empty_input')
    else
      return name.capitalize
    end
  end
end

def display_welcome_msg
  display_msg('welcome')
  prompt("Welcome #{grab_name}!")
end

def grab_number(msg)
  loop do
    display_msg(msg)
    num = clean_user_input(gets)
    if number?(num)
      return num.to_f
    elsif num == ''
      display_msg('empty_input')
    else
      display_msg('invalid_input')
    end
  end
end

def number?(num)
  (num.to_f.to_s == num) || (num.to_i.to_s == num)
end

def grab_operation(msg)
  loop do
    display_msg(msg)
    input_op = clean_user_input(gets).downcase
    OPERATIONS.each do |operation_type, variations|
      return operation_type if variations[:input_variations].include?(input_op)
    end
    display_msg('invalid_input')
  end
end

def divide_by_zero?(num2, op)
  num2 == 0 && op == 'division'
end

def calculate(num1, num2, op)
  case op
  when 'addition'
    num1 + num2
  when 'subtraction'
    num1 - num2
  when 'multiplication'
    num1 * num2
  when 'division'
    num1 / num2
  end
end

def display_calc(num1, num2, op, output)
  prompt(<<~OUTPUT
         #{num1} #{grab_operation_symbol(op)} #{num2}
         calculates to: #{output.round(2)}
         OUTPUT
        )
end

def grab_operation_symbol(op)
  OPERATIONS.each do |operation_type, variations|
    return variations[:symbol] if operation_type == op
  end
end

def calc_again?
  loop do
    display_msg('another_calc')
    go_again_answer = clean_user_input(gets).downcase

    if ['yes', 'y'].include?(go_again_answer)
      return true
    elsif ['no', 'n'].include?(go_again_answer)
      return false
    else
      display_msg('invalid_input')
    end
  end
end

# start of main
display_welcome_msg

loop do
  num1 = grab_number('first_num')
  num2 = grab_number('second_num')
  op = grab_operation('operation')

  if divide_by_zero?(num2, op)
    display_msg('zero_division')
    next
  else
    output = calculate(num1, num2, op)
    display_calc(num1, num2, op, output)
  end

  break unless calc_again?
end
