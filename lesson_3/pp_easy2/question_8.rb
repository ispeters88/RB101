# Shorten the following sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

# Review the String#slice! documentation, and use that method to make the return value 
# "Few things in life are as important as ". 
# But leave the advice variable as "house training your pet dinosaur.".

old_advice = advice.slice(advice)

advice.slice!(0..38)
# LS solution suggests a much easier way than counting the indices:
# >> advice.slice!(0, advice.index('house'))

puts advice
advice = old_advice.slice(old_advice)

# As a bonus, what happens if you use the String#slice method instead?

# >> This does not mutate the original calling variable advice. We would need to separately bind the returned new_str:

new_advice = advice.slice(0..38)
puts new_advice
puts advice
puts old_advice