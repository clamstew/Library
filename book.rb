# 
# 
class Book
  attr_accessor :author, :title, :description, :user_checked_out, 
  					:date_checked_out, :due_date

  def initialize(author, title, description)
  	@author = author
  	@title = title
  	@description = description
  	@user_checked_out
  	@date_checked_out
  	@due_date
  end
end