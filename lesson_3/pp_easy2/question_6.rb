# How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# 1)
flintstones.push("Dino")
p flintstones
flintstones.pop

# 2)
flintstones << "Dino"
p flintstones
flintstones.pop

# 3)
flintstones.append("Dino")
p flintstones
flintstones.pop