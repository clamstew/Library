# 
# 
class Book
  attr_accessor :author, :title, :description, :user_checked_out, 
  					:date_checked_out, :due_date, :status, :pub_year, :edition

  def initialize(title, author, description, pub_year = nil, edition = nil)
  	@author = author
  	@title = title
  	@description = description
  	@user_checked_out
  	@date_checked_out
  	@due_date
  	@status = "available"
  	@pub_year = pub_year
  	@edition = edition
  end
end