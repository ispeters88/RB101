# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# >> The return value is 34. While we do pass in the answer variable to the mess_with_it method, thereby
# giving access to this variable within the method, the change made to the value within the method 
# is via assignment operator and thus is non-mutating. The reference copy some_number is pointed to the value 50, but 
# the original reference answer is still pointing to 42