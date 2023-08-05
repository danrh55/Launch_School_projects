# import dependencies
require 'yaml'

# method definitions
def welcome_message
  puts 'Welcome to the mortgage calculator. What\'s your name?'
  puts "Welcome #{grab_name}!"
end

def grab_name
  loop do
    name = gets.chomp.strip.capitalize
    if name == ''
      puts 'You forgot to enter your name! What\'s your name'
    else
      return name
    end
  end
end

def calculate_again?
  puts "Do you want to do another calculation? (yes/no)"
  loop do
    ans = gets.chomp.downcase
    if ['yes', 'y'].include?(ans)
      puts 'Let\'s go again!'
      return true
    elsif ['no', 'n'].include?(ans)
      puts 'See you later'
      return false
    else
      puts 'Invalid input. Try again. (yes/no)'
    end
  end
end

def grab_inputs
  input_counter = 0

  INPUTS_DATA[:input_prompts].each do |input_prompt|
    current_type = INPUTS_DATA[:input_types].keys[input_counter]
    puts "Please enter in your #{input_prompt}"
    loop do
      input = gets.chomp.strip
      if valid_input?(input)
        INPUTS_DATA[:input_types][current_type] = input.to_f
        break
      else
        puts "Please enter your #{input_prompt}."
      end
    end
    input_counter += 1
  end
end

def valid_input?(input)
  if input == ''
    puts 'You forgot to enter in a value!'
    false
  elsif (input =~ /\D/).nil? != true
    puts 'invalid input'
    false
  else
    true
  end
end

def to_monthly_interest_rate
  apr = INPUTS_DATA[:input_types][:apr]
  (((1 + ((apr / 100)))**(1.0 / NUM_MONTHS_IN_YEAR)) - 1)
end

def calc_monthly_payment(monthly_rate)
  loan_duration_years = INPUTS_DATA[:input_types][:loan_duration_years]
  loan_duration_months = loan_duration_years * NUM_MONTHS_IN_YEAR
  formula = (1 + monthly_rate)**(-(loan_duration_months))
  INPUTS_DATA[:input_types][:principal] * (monthly_rate / (1 - (formula)))
end

def output_message(monthly_payment)
  <<~OUTPUT
  \n=> Your monthly mortgage payment: $#{monthly_payment}\n
  Your loan conditions:\n
  loan amount: $#{INPUTS_DATA[:input_types][:principal]}
  APR: #{INPUTS_DATA[:input_types][:apr]} %
  loan duration: #{INPUTS_DATA[:input_types][:loan_duration]} years
  OUTPUT
end

# main
INPUTS_DATA = YAML.load_file('inputs.yml')
NUM_MONTHS_IN_YEAR = 12.0

welcome_message

loop do
  grab_inputs

  monthly_interest_rate = to_monthly_interest_rate
  monthly_payment = calc_monthly_payment(monthly_interest_rate).round(2)

  puts output_message(format('%.2f', monthly_payment))

  break unless calculate_again?
end
