# method definitions
def welcome_msgs
  puts 'Welcome to the mortgage calculator. What\'s your name?'
  puts "Welcome #{grab_name}!"
end

def grab_name
  gets.chomp.strip.capitalize
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
  inputs = { principal: '', apr: '', loan_duration: '' }
  input_msgs = ['loan amount', 'annual APR (in % form)', 'loan duration (in months)']
  input_counter = 0
  
  input_msgs.each do |input_msg|
    puts "Please enter in your #{input_msg}"
    loop do
      input = gets.chomp.strip
      if valid_input?(input)
        inputs.store(inputs.keys[input_counter], input.to_f)
        break
      else
        puts "Invalid input. Please enter your #{input_msg} again."
      end
    end
    input_counter += 1
  end
  inputs
end

def valid_input?(input)
  (input =~ /\D/).nil?
end

def to_monthly_interest_rate(inputs)
  (((1 + ((inputs[:apr] / 100)))**(1.0 / 12)) - 1)
end

def calc_monthly_payment(inputs, monthly_rate)
  formula = (1 + monthly_rate)**(-inputs[:loan_duration])
  inputs[:principal] * (monthly_rate / (1 - (formula)))
end

def output_msg(inputs, monthly_payment)
  <<~OUTPUT
  \n=> Your monthly mortgage payment: $#{monthly_payment}\n
  Your loan conditions:\n
  loan amount: $#{inputs[:principal]}
  APR: #{inputs[:apr]} %
  loan duration: #{inputs[:loan_duration]} months
  OUTPUT
end

# main
welcome_msgs

loop do
  inputs = grab_inputs

  monthly_interest_rate = to_monthly_interest_rate(inputs)
  monthly_payment = calc_monthly_payment(inputs, monthly_interest_rate).round(2)

  puts output_msg(inputs, monthly_payment)

  break unless calculate_again?
end
