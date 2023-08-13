require 'yaml'

INPUTS = YAML.load_file('inputs.yml')
NUM_MONTHS_IN_YEAR = 12.0

def display_welcome_msg
  display_msg('welcome')
  puts "Welcome #{grab_name}!"
end

def display_msg(msg)
  puts INPUTS[msg]
end

def grab_name
  loop do
    name = gets.chomp.strip.capitalize
    if name == ''
      display_msg('empty_input')
    else
      return name
    end
  end
end

def calc_again?
  loop do
    display_msg('calc_again')
    ans = gets.chomp.strip.downcase
    if ['yes', 'y'].include?(ans)
      display_msg('go_again')
      return true
    elsif ['no', 'n'].include?(ans)
      display_msg('exit')
      return false
    else
      display_msg('invalid_input')
    end
  end
end

def grab_input(input_type)
  loop do
    display_msg(input_type)
    input = gets.chomp.strip
    return input.to_f if valid_input?(input)
  end
end

def valid_input?(input)
  if input == ''
    display_msg('empty_input')
    false
  elsif (input =~ /\D/).nil? != true
    display_msg('invalid_input')
    false
  else
    true
  end
end

def convert_to_monthly_rate(apr)
  (((1 + ((apr / 100)))**(1.0 / NUM_MONTHS_IN_YEAR)) - 1)
end

def calc_monthly_payment(principal, monthly_rate, loan_duration_months)
  formula = (1 + monthly_rate)**(-(loan_duration_months))
  (principal * (monthly_rate / (1 - (formula)))).round(2)
end

def output_message(principal, apr, loan_duration_years, monthly_payment)
  <<~OUTPUT
  \n=> Your monthly mortgage payment: $#{format('%.2f', monthly_payment)}\n
  Your loan conditions:
  loan amount: $#{format('%.2f', principal)}
  APR: #{format('%.2f', apr)} %
  loan duration: #{loan_duration_years} years\n
  OUTPUT
end

# main
display_welcome_msg

loop do
  principal = grab_input('principal')
  apr = grab_input('apr')
  loan_duration_years = grab_input('loan_duration_years')

  monthly_interest_rate = convert_to_monthly_rate(apr)
  loan_duration_months = loan_duration_years * NUM_MONTHS_IN_YEAR
  monthly_payment = calc_monthly_payment(principal,
                                         monthly_interest_rate,
                                         loan_duration_months)

  puts output_message(principal, apr, loan_duration_years, monthly_payment)

  break unless calc_again?
end
