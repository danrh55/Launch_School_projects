require 'yaml'

MESSAGE = YAML.load_file('message.yml')

def prompt(str)
  puts "=> #{str}"
end

def welcome_msg
  prompt(MESSAGE['welcome_message'])
  loop do
    name = gets.chomp.strip
    if name == ''
      prompt(MESSAGE['invalid_input'])
    else
      prompt("Welcome #{name.capitalize}!")
      break
    end
  end
end

def grab_numbers
  input_index = 0
  inputs = []
  # use recursions instead.
  loop do
    prompt(MESSAGE['input_messages'][input_index])
    input = gets.chomp.strip
    if number?(input) == true
      inputs.push(input.to_f)
      input_index += 1
      return inputs if inputs.length == 2
    else
      prompt(MESSAGE['invalid_input'])
    end
  end
end

def grab_operation(inputs)
  prompt(MESSAGE['input_messages'][2])
  operation = gets.chomp.strip.downcase
  if MESSAGE['operation_variations'].flatten(-1).include?(operation)
    MESSAGE['operation_variations'].each do |op, operation_variations|
      if operation_variations.include?(operation)
        return check_operation(inputs, op)
      end
    end
  else
    prompt(MESSAGE['invalid_input'])
    grab_operation(inputs)
  end
end

def check_operation(inputs, op)
  if inputs[1] == 0 && op == 'division'
    loop do
      prompt(MESSAGE['divide_by_zero_msg'])
      inputs = grab_numbers
      if inputs[1] != 0
        return inputs.push(op.to_s)
      end
    end
  else
    inputs.push(op.to_s)
  end
end

def number?(num)
  (num.to_f.to_s == num) || (num.to_i.to_s == num)
end

def calculate(inputs)
  case inputs[2]
  when 'addition'
    inputs[0] + inputs[1]
  when 'subtraction'
    inputs[0] - inputs[1]
  when 'multiplication'
    inputs[0] * inputs[1]
  when 'division'
    inputs[0] / inputs[1]
  end
end

def output_statement(inputs, output)
  prompt("#{inputs[0]} #{MESSAGE['operation_symbols'][inputs[2]]} #{inputs[1]} calculates to: #{output}")
end

def calc_again?
  prompt(MESSAGE['calc_again?'])
  go_again_answer = gets.chomp.downcase
  if MESSAGE['valid_answers'].include?(go_again_answer)
    if go_again_answer == 'n' || go_again_answer == 'no'
      prompt(MESSAGE['thank_you_msg'])
    else
      prompt('Let\'s go again')
      run_calc
    end
  else
    prompt(MESSAGE['invalid_input'])
    calc_again?
  end
end

def valid_answer?(ans)
  MESSAGE['valid_answers'].include?(ans)
end

def run_calc
  inputs = grab_operation(grab_numbers())
  # binding.pry
  output = calculate(inputs).round(2)
  output_statement(inputs, output)
  calc_again?
end

# start of main
welcome_msg

run_calc
