require 'yaml'

message = YAML.load_file('message.yml')

def prompt(str)
  puts "=> #{str}"
end

def number?(num)
  (num.to_f.to_s == num) || (num.to_i.to_s == num)
end

def calculate(num1, num2, op)
  if op == '1' || op == 'add' || op == 'addition'
    num1 + num2
  elsif op == '2' || op == 'minus' || op == 'subtract'
    num1 - num2
  elsif op == '3' || op == 'multiply' || op == 'multiplication'
    num1 * num2
  elsif op == '4' || op == 'divide' || op == 'division'
    num1 / num2
  else
    false
  end
end

def valid_answer?(ans)
  ans == 'y' || ans == 'yes' || ans == 'n' || ans == 'no'
end

# Welcome message
prompt(message['welcome_message'])
name = gets.chomp
prompt("Welcome #{name.capitalize}!")

loop do
  num1 = ''
  loop do
    prompt('What\'s your first number?')
    num1 = gets.chomp
    if number?(num1) == true
      break
    else
      prompt(message['invalid_input'])
    end
  end
  
  num2 = ''
  loop do
    prompt('What\'s your second number?')
    num2 = gets.chomp
    if number?(num2) == true
      break
    else
      prompt(message['invalid_input'])
    end
  end

  answer = ''
  operation = ''
  loop do
    prompt(message['operation_message'])
    operation = gets.chomp.downcase
    answer = calculate(num1.to_f, num2.to_f, operation)
    if answer == false
      prompt(message['invalid_input'])
    else
      break
    end
  end

  puts "#{num1} #{message['operation_options'][operation]} #{num2} calculates to: #{answer.round(2)}"
  
  go_again_answer = ''
  loop do
    prompt(message['calc_again?'])
    go_again_answer = gets.chomp.downcase
    if valid_answer?(go_again_answer)
      break
    else
      prompt(message['invalid_input'])
    end
  end

  if go_again_answer == 'n' || go_again_answer == 'no'
    prompt(message['thank_you_msg'])
    break
  end
end
