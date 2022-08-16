require "pry-byebug"

def duplicate_count(text)
  duplicates = Hash.new
  #binding.pry
  text.downcase.chars.uniq.each { |char| duplicates[char] = text.scan(/#{char}/i).size }
  duplicates.count { |_, qty| qty > 1 }
end


p duplicate_count("abcdeaB")
p duplicate_count("Indivisibilities")