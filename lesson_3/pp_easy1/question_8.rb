# Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number

flintstones.select! { |key, value| key == "Barney" }
flintstones_arr = flintstones.flatten
p flintstones_arr

# also see Hash#assoc:
# flinstones.assoc("Barney")