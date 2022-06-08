# Practice Problem 8

# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

def pp_8(hsh)
  hsh.each_value do |arr|
    arr.each do |word|
      word.chars.each { |char| puts char if char.match?(/[aeiou]/) }
    end
  end
end

pp_8(hsh)