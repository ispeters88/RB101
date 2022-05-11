# inputs: loan amount, APR, loan duration
  # data structures: float, float, int
# output: monthly interest rate, loan duration in months, monthly payment
  # data structures: float, int, float

require "pry"
require "yaml"
MESSAGES = YAML.load_file('interest_calc.yml')

def prompt(msg)
  puts "=> #{msg}"
end

def monthly_payment(amt, m_rate, length)
  amt * (m_rate / (1 - (1 + m_rate)**(-length)))
end

def valid_float?(num)
  Float(num) rescue false
end

def valid_int?(num)
  Integer(num) rescue false
end

loop do
  prompt MESSAGES['welcome']
  prompt MESSAGES['separator']

  amt = nil
  apr = nil
  dur_months = nil

  loop do
    prompt MESSAGES['amt']
    amt = gets.chomp
    if valid_float?(amt) && amt.to_f > 0
      break
    else
      prompt MESSAGES['valid_amt']
    end
  end

  loop do
    prompt MESSAGES['apr']
    apr = gets.chomp
    if valid_float?(apr) && apr.to_f > 0
      break
    else
      prompt MESSAGES['valid_apr']
    end
  end

  loop do
    prompt MESSAGES['dur_months']
    dur_months = gets.chomp
    if valid_int?(dur_months) && dur_months.to_i > 0
      break
    else
      prompt MESSAGES['valid_dur_months']
    end
  end

  amt = amt.to_f
  apr = apr.to_f / 100
  m_rate = apr / 12
  dur_months = dur_months.to_i

  m_pay = monthly_payment(amt, m_rate, dur_months)

  prompt "Your loan's monthly payment is $#{m_pay.round(2)}"

  prompt MESSAGES['repeat']
  resp = gets.chomp
  break unless resp.downcase().start_with?('y')
end

prompt "Thanks for using this Mortgage Calculator"
prompt "Goodbye!"