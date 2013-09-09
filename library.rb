# how to add two weeks to time.now =-- Time.now + (2*7*24*60*60)
# 
class Library
  require 'csv'

  attr_accessor :total_num_books, :library_books, :name, :address

  def initialize(name, address)
  	@total_num_books = 0
  	@library_books = []
  	@name = name
  	@address = address
  end

  def print_all_books
    book_number = 1
    puts "========= All the books in #{self.name} ========================"
  	self.library_books.each do |book|
  	  puts "----- Book #{book_number} ------"
  	  puts "TITLE: #{book.title} "
  	  puts "DESCRIPTION: #{book.description} "
      puts "AUTHOR: #{book.author}"
      puts "PUBLISH DATE: #{book.pub_year}" if book.pub_year != nil
      puts "EDITION: #{book.edition}" if book.edition != nil
      if book.user_checked_out != nil
  		  puts "USERNAME CHECKED OUT TO: #{book.user_checked_out.username}"
  		  puts "DATE CHECKED OUT: #{book.date_checked_out.strftime("%B %d, %Y")}"
  		  puts "DUE DATE: #{book.due_date.strftime("%B %d, %Y")}"
  	  end
  	  show_book_status(book)
  	  book_number += 1
  	end
	  puts "========= End of all the books in #{self.name} listing ========="
  end

  # Users should be able to see 
  # a list of who has checked out which book 
  # and when those books are due to be returned
  def show_all_checked_out_books
    book_number = 1
    puts "========= All 'Checked-out' books in #{self.name} ========================"
	  self.library_books.each do |book|
    if book.user_checked_out != nil && book.status == "checked out"
    	puts "----- Book #{book_number} ------"
	    puts "#{book.title} "
	    puts "#{book.description} "
      puts "#{book.author}"
		  puts "USERNAME CHECKED OUT TO: #{book.user_checked_out.username}"
		  puts "DATE CHECKED OUT: #{book.date_checked_out.strftime("%B %d, %Y")}"
		  puts "DUE DATE: #{book.due_date.strftime("%B %d, %Y")}"
		  show_book_status(book)
	    book_number += 1
	  end
	end
	puts "========= End of all the 'Checked-out' books in #{self.name} listing ========="
  end

  def add_book(book) # , user)
  	# push into library books
  	# book.user_checked_out = user
  	@library_books << book
  	@total_num_books += 1
  	puts "BOOK ADDED: #{book.title} is now available for checkout at #{self.name}, which currently has #{total_num_books} books in circulation."
  end

  def check_out_book(book, user, date_checked_out = nil) # will be able to do for one week intervals
  	# checks to see that a user does not have 2 other books checked out
  	# if user has over due books cannot check out any new books until return overdue books
  	
  	account_flag = check_if_user_has_overdue_books(user)
  	if account_flag == true  # check to see if user's account is flagged with any overdue books
      puts "ACCOUNT FLAGGED: Sorry, you have overdue books. You must return those before you can request new books."
    else
  	  if user.num_books_checked_out < 2 # if user has less that 2 books proceed with checkout
  	    if book.date_checked_out == nil # if book has not checkout date, proceed with checkout -- THIS SHOWS IT IS NOT CHECKED OUT
  	      # initiate checkout process
  	      book.user_checked_out = user
  	      if date_checked_out # can add a custom checkout date here
  	        book.date_checked_out = date_checked_out
  	        book.due_date = date_checked_out + (1*7*24*60*60)
  	      else
  	      	book.date_checked_out = Time.new
  	        book.due_date = Time.new + (1*7*24*60*60)
  	      end
  	      user.num_books_checked_out += 1 # increment number of books a user has checked out
  	      book.status = "checked out"
  	      puts "Congrats #{user.name}! You checked out '#{book.title}'' by #{book.author}. Please have it back on '#{book.due_date.strftime("%B %d, %Y")}' before noon, otherwise we will have to flag your account. You currently have #{user.num_books_checked_out} books from our library."
  	    else 
  	  	  puts "Sorry, your '#{book.title}' is checked out to #{user.name}.  It is expected to return on '#{book.due_date.strftime("%B %d, %Y")}' before noon."
  	    end
  	  else 
  	    puts "Sorry the #{self.name} is unable to lend you '#{book.title}'' at this time, you already have 2 books out. Please return some books in order to borrow more."
  	  end
  	end
  end

  def schedule_book_checkout book, user
    # if book @future_check_out_reserved == false
    # check of book.status == "checked out"
    # then mark @future_check_out_reserved  to true
    # put user in @future_check_out user
    if book.future_check_out_reserved == false && book.status == "checked out"
      book.future_check_out_reserved = true
      book.future_check_out_user = user
      puts "Future check out for '#{book.title}' is scheduled for '#{user.name}'."
    elsif book.status != "checked out"
      puts "This book has a status other than checked out: #{book.status} by #{book.user_checked_out.name}."
    else 
      puts "'#{book.title}' is reserved for future checkout by #{book.future_check_out_user.name}."
    end

    # else 
    # puts book status is either not checked out or someone else has reserved the book
    # could do a couple conditions in the else to give you a better error message
  end

  def schedule_book_extension book, user
    # if @one_time_extension == false
    # allow a user to add + 1 week to the due date
    # set @one_time_extension to true in this method
    # ADD on return book method set the @one_time_extension to false again
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
        # user.account_flag = true # might implement this as a nice to have if there is time
  	  end
  	end
  	flag_account
  end

  def return_book(book)
  	user = book.user_checked_out
    if book.date_checked_out == nil
      puts "This book is not checked out. There must be some crazy error happening!"
    else
      # process to check in book
      book.user_checked_out = nil
      book.date_checked_out = nil
      book.due_date = nil
      book.status = "available"
      user.num_books_checked_out -= 1 # decrement number of books a user has checked out
      puts "Thanks for returning '#{book.title}' by '#{book.author}'. Sharing is caring. You currently have #{user.num_books_checked_out} books from our library."
    end
  end

  # Users should be able to check a book's status 
  # (e.g. available, checked out, overdue or lost)
  def show_book_status(book)
  	if book.due_date != nil && book.due_date < Time.new
  	  book.status = "OVERDUE!"
    end
    puts "BOOK STATUS: #{book.status}"
  end

  

  # Users should be able to see a list of books that are overdue
  def show_overdue_books
    book_number = 1
    puts "========= All 'OVERDUE' books in #{self.name} ========================"
	  self.library_books.each do |book|
      if book.user_checked_out != nil && book.status == "OVERDUE!"
      	puts "----- Book #{book_number} ------"
        puts "#{book.title} "
        puts "#{book.description} "
        puts "#{book.author}"
  	    puts "USERNAME CHECKED OUT TO: #{book.user_checked_out.username}"
  	    puts "DATE CHECKED OUT: #{book.date_checked_out.strftime("%B %d, %Y")}"
  	    puts "DUE DATE: #{book.due_date.strftime("%B %d, %Y")}"
  	    show_book_status(book)
        book_number += 1
      end
	  end
	  puts "========= End of all the 'OVERDUE' books in #{self.name} listing ========="
  end

  # Import books from .csv file
  def import file_path
    File.open(file_path).read.split(";").each do |line|
      title, author, description, year_published, edition = line.split(",")
      @library_books << Book.new(title, author, description, year_published, edition)
    end
    print_all_books
  end

end




















