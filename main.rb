#require 'time'

require_relative 'library'
require_relative 'user'
require_relative 'book'


# ========================================================
#
# Demo 1:  Users should be able to add books to a library
#
#
# =========================================================
puts "DEMO 1: ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"


local_library = Library.new("Shady Oaks Library", "621 West 90th St, Austin, TX 78722")
clay = User.new(
    "Clay", 
    "clamstew", 
    "55 Main Street, Austin, TX 78722",
    "555-555-5555"
  ) # name, username, address
the_crucible = Book.new(
    "The Crucible", 
    "Arthur Miller", 
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
    "The Whale is a novel by Herman Melville, first published in 1851.",
    "1851", 
    "1st"
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
local_library.print_all_books




# ========================================================
#
# Demo 2: A user should be able to check out books
#                from the library for one week intervals
#
# =========================================================
puts "DEMO 2: ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

local_library.check_out_book(the_crucible, clay)
# show requirement 2 is implemeneted
local_library.print_all_books




# ========================================================
#
# Demo 3: A user should not be able to check out 
#                more than two books at any given time
#
# =========================================================
puts "DEMO 3: ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
# local_library.check_if_user_has_overdue_books(clay) ## shows what this function is returning
# at this point user clay already has the_crucible checked out
local_library.check_out_book(the_republic, clay) # checks out a second book for clay
local_library.check_out_book(moby_dick, clay) # attempts to check out a third book for clay but should fail and return a message that user cannot check out more than one book at once

local_library.print_all_books # to try to debug why its saying clay successfully checked out moby dick


# ========================================================
#
# Demo 4: Users with overdue books should not be able to 
#                request any new books until they turn all their overdue books in
#
# =========================================================
puts "DEMO 4: ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

# create a new user to test, since clay already has 2 books out and there is not check_in method yet
bill = User.new(
    "Bill Smith", 
    "billsmith", 
    "65 Main Street, Austin, TX 78711",
    "555-555-6666"
  ) # name, username, address


local_library.check_out_book(moby_dick, bill, Time.new - (4*7*24*60*60)) # should show on the second book that Bill has this as an overdue book
# try to check out a second book - that flag account function should run
# this demo should then output --> ACCOUNT FLAGGED: Sorry, you have overdue books. You must return those before you can request new books.
local_library.check_out_book(scarlett_letter, bill)


# ========================================================
#
# Demo 5: Users should be able to check in 
#           books to the library when they're finished with them
#
# =========================================================
puts "DEMO 5: ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

local_library.return_book(the_republic) # clay checks back in his second book the_republic here
local_library.check_out_book(scarlett_letter, clay) # clay should now be able to check this out b/c he has returned his second book in the line above

local_library.print_all_books




# ========================================================
#
# Demo 6: Users should be able to check a book's status (e.g. available, checked out, overdue or lost)
#          Also had to make a user function in this part so a user could lose a book
#
# =========================================================
puts "DEMO 6: ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

clay.lose_book(scarlett_letter, "someone stole his bookbag") # clay loses the book here
local_library.print_all_books


# ========================================================
#
# Demo 7: Users should be able to see a list of who has checked 
#            out which book and when those books are due to be returned
#
# =========================================================
puts "DEMO 7: ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
local_library.show_all_checked_out_books



# ========================================================
#
# Demo 8: Users should be able to see a list of books that are overdue
#
# =========================================================

puts "DEMO 8: ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
local_library.show_overdue_books
































