# how to add two weeks to time.now =-- Time.now + (2*7*24*60*60)
# 
class Library
  attr_accessor :total_num_books, :library_books, :name, :address

  def initialize(name, address)
  	@total_num_books = 0
  	@library_books = []
  	@name = name
  	@address = address
  end

  def add_book(book) # , user)
  	# push into library books
  	# book.user_checked_out = user
  	@library_books << book
  	@total_num_books += 1
  end

  def check_out_book(book, user) # will be able to do for one week intervals
  	# checks to see that a user does not have 2 other books checked out
  	# if user has over due books cannot check out any new books until return overdue books
  	if book.date_checked_out == nil
  		book.user_checked_out = user
  		book.date_checked_out = Time.new
  		book.due_date = Time.new + (1*7*24*60*60)
  	end
  end

  def check_in_book
  end

  def show_user_books # requirement: Checked-out books should be associated with a user
  end

  # Users should be able to check a book's status 
  # (e.g. available, checked out, overdue or lost)
  def show_book_status 

  end

  # Users should be able to see 
  # a list of who has checked out which book 
  # and when those books are due to be returned
  def show_all_books_by_return_date
  end

  # Users should be able to see a list of books that are overdue
  def show_overdue_books

  end

end