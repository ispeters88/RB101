# Grade book

=begin
Write a method that determines the mean (average) of the three scores passed to it, 
and returns the letter value associated with that grade.

Numerical Score Letter	Grade
90 <= score <= 100	'A'
80 <= score < 90	'B'
70 <= score < 80	'C'
60 <= score < 70	'D'
0 <= score < 60	'F'

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.
=end

GRADES = { 0 => 'F', 1 => 'F', 2 => 'F', 3 => 'F', 4 => 'F', 5 => 'F', 6 => 'D', 7 => 'C', 8 => 'B', 9 => 'A', 10 => 'A' }

def get_grade(*grades)
  GRADES[grades.sum / 3 / 10]
end


## Examples ##
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(100, 100, 105)