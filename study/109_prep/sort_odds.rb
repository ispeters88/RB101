require "pry-byebug"

def sort_array(source_array)
  odds = source_array.select(&:odd?).sort
  source_array.map { |num| num.odd? ? odds.shift : num }
end

p sort_array([5, 3, 2, 8, 1, 4, 11])