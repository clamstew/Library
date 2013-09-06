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
moby_dick = Book.new(
    "Moby Dick", 
    "Herman Melville", 
    "The Whale is a novel by Herman Melville, first published in 1851."
  ) # author, title, description
scarlett_letter = Book.new(
    "The Scarlett Letter", 
    "Herman Melville", 
    "Hester Prine deals with being an adulterous in an old school town that is not down with that."
  ) # author, title, description
# add a couple books to my new library
local_library.add_book(the_crucible) # which book
local_library.add_book(the_republic) # which book
local_library.add_book(moby_dick) # which book
local_library.add_book(scarlett_letter) # which book

# show requirement 1 is implemeneted
local_library.library_books.each do |book|
	puts book.title
	puts book.description
	puts book.author
	# puts book.user_checked_out.username
end




# ========================================================
#
# Requirement 2: A user should be able to check out books
#                from the library for one week intervals
#
# =========================================================
local_library.check_out_book(the_crucible, clay)
# show requirement 1 is implemeneted
local_library.library_books.each do |book|
	puts book.title
	puts book.description
	puts book.author
	if book.user_checked_out != nil
	  puts book.user_checked_out.username 
	  puts book.date_checked_out
	  puts book.due_date
	end
end




# ========================================================
#
# Requirement 3: A user should not be able to check out 
#                more than two books at any given time
#
# =========================================================
# at this point user clay already has the_crucible checked out
local_library.check_out_book(the_republic, clay) # checks out a second book for clay
local_library.check_out_book(moby_dick, clay) # attempts to check out a third book for clay but should fail and return a message that user cannot check out more than one book at once



































