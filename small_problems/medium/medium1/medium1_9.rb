# Fibonacci Numbers (Procedural)

# In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. 
# In a language that is not optimized for recursion, some (not all) recursive methods can be extremely slow 
# and require massive quantities of memory and/or stack space.
# 
# Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; 
# as a result, the Fibonacci solution is only useful up to about fibonacci(40). With higher values of nth, 
# the recursive solution is impractical. (Our tail recursive solution did much better, 
# but even that failed at around fibonacci(8200).)
# 
# Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.
# 
# Rewrite your recursive fibonacci method so that it computes its results without recursion.

def fibonacci(n)
  fib_arr = [1, 1]
  2.upto(n - 1) do |num|
    fib_arr[num] = fib_arr[num - 1] + fib_arr[num - 2]
  end
  fib_arr[n - 1]
end



## Examples ##
p fibonacci(20)# == 6765
p fibonacci(100)# == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501


## Data/Algorithm ##
# > Given an integer, n - 
#     1) Initialize an array, fib_arr. It should initially contain two elements, both equal to 1
#     2) Count up to n. On each iteration i, 
#         > calculate the ith fibonacci value, which is the (ith - 1) value added to the (ith - 2) value
#         < add this number to fib_arr
#