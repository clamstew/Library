class Book
  attr_accessor :author, :title, :description, :user_checked_out, 
  					:date_checked_out, :due_date, :status, :pub_year, :edition,
  					:reviews,
            :future_check_out_reserved, :future_check_out_user, :one_time_extension
  
  # Public: Initialzie a book object - runs on the instanciation of a new book.
  #
  # title  - The String of the title of the book
  # author  - The String of the author of the book
  # description  - The String of the description of the book
  # publication year  - The String of the publication year of the book
  # edition  - The String of the edition of the book
  # author - The Integer number of times to duplicate the text.
  #
  # Examples
  #
  #   moby_dick = Book.new(
  #    "Moby Dick", 
  #    "Herman Melville", 
  #    "The Whale is a novel by Herman Melville, first published in 1851.",
  #    "1851", 
  #    "1st"
  #   )
  #   # => true
  #
  # Returns true
  def initialize title, author = nil, description = nil, pub_year = nil, edition = nil
  	@author = author
  	@title = title
  	@description = description
  	@user_checked_out
  	@date_checked_out
  	@due_date
  	@status = "available"
  	@pub_year = pub_year
  	@edition = edition
  	@reviews = []
    @future_check_out_reserved = false
    @future_check_out_user
    @one_time_extension = false
  end


  # Public: Get all the book reviews for a book object that this method is called on
  #
  # Examples
  #
  #   moby_dick.get_all_book_reviews
  #   # => '{:rating=>4, :review=>"Great Read", :user=>"clamstew", :datetime=>2013-09-09 09:01:02 -0500}
  #          {:rating=>3, :review=>"Really really hard to read and stay awake through. It is about hunting a white whale...", :user=>"billsmith", :datetime=>2013-09-09 09:01:02 -0500}'
  #
  # Returns the each review for the book object this method is called on as a hash.
  def get_all_book_reviews
  	puts "Book Reviews for: '#{@title}'"
  	@reviews.each do |review|
      puts review
  	end
  end
end