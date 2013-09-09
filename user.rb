class User
  attr_accessor :name, :username, :address, :phone, :num_books_checked_out, :account_flag

  # Public: Initialize a user object with some instance variables
  #
  # name  - The String of the name for this user object.
  # username - The String of the username for this user object.
  # address - The String of the user's address for this user object.
  # phone - The String of the user's phone number for this user object.
  # 
  #
  # Examples
  #
  #   john = User.new(
  #     "John Smith", 
  #     "jsmith",
  #     "716 Congress Ave, Austin, TX 78211",
  #     "555-555-5555"
  #   )
  #   # => #<User:0x007fc8838533f8 @name="John Smith", @username="jsmith", 
  #          @address="716 Congress Ave, Austin, TX 78211", @phone="555-555-5555", 
  #          @num_books_checked_out=0, @account_flag=false>
  #
  # Sets all the instance variables for each new user object
  # with name, username, address, and phone parameters passed in as well as 
  # auto-sets num_books_check_out to zero and account_flag ivar to false
  def initialize(name, username, address, phone)
  	# @id ||= # might put in user id's
  	@name = name
  	@username = username
  	@address = address
  	@phone = phone
  	@num_books_checked_out = 0
  	@account_flag = false
  end
  
  # Public: Allow the user to lose a book, which marks the book's status as lost
  #
  # book  - The book Object to be lost.
  # reason - The String with a reason the user lost the book.
  #
  # Examples
  #   
  #   john.lose_book scarlett_letter, "his backpack was stolen"
  #   # => #<Book:0x007fc8838533f8 ... @status="LOST, his backpack was stolen" ... >
  #
  # Sets book.status ivar to The String, "LOST, #{reason}"
  def lose_book book, reason
    book.status = "LOST, because #{reason}"
  end

  # Public: lets a user leave a book review
  #
  # book  - The Book Object to add a hash to for .
  # rating - The Integer with a rating 1-5
  # review - The String with a description of the review - will default to nil if nothing input
  #
  # Examples
  #   
  #   john.leave_book_review scarlett_letter, 4, "Great Book!"
  #   # => #<Book:0x007fc8838533f8 ... @reviews=[{rating: 4, review: "Great Book!", user: "jsmith", datetime: "2013-09-09 12:54:16 -0500"}] ... >
  #
  # Pushes the new_review_hash into the @review ivar array for that book object.
  def leave_book_review book, rating, review = nil
  	new_review_hash = { rating: rating, review: review, user: self.username, datetime: Time.new }
  	book.reviews << new_review_hash
  end
end































