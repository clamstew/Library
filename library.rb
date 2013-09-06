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

  def check_out_book(book, user, date_checked_out = nil) # will be able to do for one week intervals
  	# checks to see that a user does not have 2 other books checked out
  	# if user has over due books cannot check out any new books until return overdue books
  	
  	account_flag = check_if_user_has_overdue_books(user)
  	if account_flag == true  # check to see if user's account is flagged with any overdue books
      puts "ACCOUNT FLAGGED: Sorry, you have overdue books. You must return those before you can request new books."
    else
  	  if user.num_books_checked_out < 2 # if user has less that 2 books proceed with checkout
  	    if book.date_checked_out == nil # if book has not checkout date, proceed with checkout
  	      book.user_checked_out = user
  	      if date_checked_out # can add a custom checkout date here
  	        book.date_checked_out = date_checked_out
  	        book.due_date = date_checked_out + (1*7*24*60*60)
  	      else
  	      	book.date_checked_out = Time.new
  	        book.due_date = Time.new + (1*7*24*60*60)
  	      end
  	      user.num_books_checked_out += 1 # increment number of books a user has checked out
  	    else 
  	  	  puts "Sorry, your book is checked out. to #{user.name}.  It is expected to return on #{book.due_date}"
  	    end
  	  else 
  	    puts "Sorry, you already have 2 books out. Please return some books in order to borrow more"
  	  end
  	end
  end

  # =======
  #
  #
  # method checks for any over due books for a given user and sends a flag if there is
  #
  #
  # =======
  def check_if_user_has_overdue_books(user)
  	flag_account = false
  	@library_books.each do |book|
  	  if book.user_checked_out == user && book.due_date < Time.new
        flag_account = true
        user.account_flag = true
  	  end
  	end
  	flag_account
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