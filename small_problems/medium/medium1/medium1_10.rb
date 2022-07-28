# Fibonacci Numbers (Last Digit)

# In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. 
# This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

def fibonacci_last(n)
  first, last = [1, 1]
  3.upto(n) do
    first, last = [last, (first + last) % 10]
  end
  last
end

## Examples ##
# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# fibonacci_last(123456789) # -> 4


## Further Exploration ##

def fib_last_fast(n)
  fib_last_uniq = get_unique_lasts
  num_uniq_lasts = fib_last_uniq.size

  last_idx = (n - 1) % num_uniq_lasts
  fib_last_uniq[last_idx]
end

def get_unique_lasts
  lasts = [1, 1]
  loop do
    next_last = (lasts[-2] + lasts[-1]) % 10
    if lasts[-1] == lasts[0] && next_last == lasts[1]
      return lasts[0..-2]
    else
      lasts << next_last
    end
  end
end

p fib_last_fast(123456789987745)