# 
# 
class Book
  attr_accessor :author, :title, :description, :user_checked_out, 
  					:date_checked_out, :due_date, :status, :pub_year, :edition,
  					:reviews,
            :future_check_out_reserved, :future_check_out_user, :one_time_extension

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

  def get_all_book_reviews
  	puts "Book Reviews for: '#{@title}'"
  	@reviews.each do |review|
      puts review
  	end
  end

end