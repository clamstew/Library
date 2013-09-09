class User
  attr_accessor :name, :username, :address, :phone, :num_books_checked_out, :account_flag

  # Public: Initialize a user object with some instance variables
  #
  # name  - The String of the name for this user object.
  # username - The String of the username for this user object.
  # count - The Integer number of times to duplicate the text.
  #
  # Examples
  #
  #   multiplex('Tom', 4)
  #   # => 'TomTomTomTom'
  #
  # Returns the duplicated String.
  def initialize(name, username, address, phone)
  	# @id ||= # might put in user id's
  	@name = name
  	@username = username
  	@address = address
  	@phone = phone
  	@num_books_checked_out = 0
  	@account_flag = false
  end
  
  # user needs to be able to loose a book so a books status can be set to lost
  def lose_book book, reason
    book.status = "LOST, because #{reason}"
  end

  def leave_book_review(book, rating, review = nil)
  	new_review_hash = { rating: rating, review: review, user: self.username, datetime: Time.new }
  	book.reviews << new_review_hash
  end

  

end