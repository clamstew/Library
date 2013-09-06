require_relative 'library'
require_relative 'user'
require_relative 'book'

# Requirement 1: Users should be able to add books to a library
local_library = Library.new("Shady Oaks Library", "621 West 90th St, Austin, TX 78722")
clay = User.new(
    "Clay", 
    "clamstew", 
    "55 Main Street, Austin, TX 78722",
    "555-555-5555"
  ) # name, username, address
the_crucible = Book.new(
    "Arthur Miller", 
    "The Crucible", 
    "The Crucible is a 1953 play by the American playwright Arthur Miller."
  ) # author, title, description
the_republic = Book.new(
    "The Republic", 
    "Plato", 
    "Plato chronicals his view of the ordered soul within the context of an ideal city."
  ) # author, title, description
# add a couple books to my new library
local_library.add_book(the_crucible, clay) # which book
local_library.add_book(the_republic, clay) # which book

# show requirement 1 is implemeneted
local_library.library_books.each do |book|
	puts book.title
	puts book.description
	puts book.author
	puts book.user_checked_out.username
end

