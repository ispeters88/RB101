# Egyptian Fractions

=begin
A Rational Number is any number that can be represented as the 
result of the division between two integers, e.g., 1/3, 3/2, 22/7, etc. 
The number to the left is called the numerator, and the number to the right is called the denominator.

A Unit Fraction is a rational number where the numerator is 1.

An Egyptian Fraction is the sum of a series of distinct unit fractions (no two are the same), such as:

1   1    1    1
- + - + -- + --
2   3   13   15

Every positive rational number can be written as an Egyptian fraction. For example:

    1   1   1   1
2 = - + - + - + -
    1   2   3   6

Write two methods: one that takes a Rational number as an argument, 
and returns an Array of the denominators that are part of an Egyptian Fraction 
representation of the number, and another that takes an Array of numbers in the same format, 
and calculates the resulting Rational number. You will need to use the Rational class provided by Ruby.

=end

## Problem ##
#   < egyptian >
# input - rational number
# output - array containing denominators of components of egyptian fraction for input
#   < unegyptian >
# input - array containing denominators of components of egyptian fraction for input
# output - rational number

# rules/reqs
# questions
#   1) is it fine to mutate the input rational number? (assuming yes)
#   2) what should we return if the input is 0?

require "pry-byebug"

def egyptian(rat)
  result = Array.new
  denom = 1

  while rat > 0
    next_fract = Rational(1, denom)
    if rat >= next_fract
      rat -= next_fract
      result << next_fract.denominator
    end
    denom += 1
  end

  result
end

def unegyptian(denoms)
  denoms.map { |denom| Rational(1, denom) }.sum
end

def unegyptian(denoms)
  denoms.inject(0) { |sum, denom| sum + Rational(1, denom) }
end


## Examples ##
#p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
#p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
#p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]
#p egyptian(Rational(1,2))
#p egyptian(Rational(127,130))

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

## Data/Algorithm ##
##    egyptian    ##
# > Given a rational number, rat -
#     1) initialize an array to be returned - result
#     2) initialize an integer <denom> to 1
#     3) iterate:
#         > if rat >= unit fraction with denominator = demon, subtract/assign that unit fraction from rat
#               (unless rat < unit fraction)
#         > add denom to result array
#         > stop if rat = 0


##   unegyptian   ##
# > Given an array of integers, denoms - 
#     1) create an integer variable <max> and set it to the largest value in denoms
#     2) transformatively iterate over denoms:
#         > multiple 1 by <max> divided by the denominator
#     3) calc the sum of all the transformed values of denoms and return it