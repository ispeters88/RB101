# Practice Problem 2

# How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

def sort_books(library)
  library.sort do |hsh1, hsh2|
    hsh1[:published].to_i <=> hsh2[:published].to_i
  end
end

p sort_books(books)


## cleaner ##
def sort_cleaner(library)
  books.sort_by do |book|
    book[:published]
  end
end