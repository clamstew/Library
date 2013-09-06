# 
# 
class Book
  attr_accessor :author, :title, :description, :user_checked_out, 
  					:date_checked_out, :due_date, :status

  def initialize(title, author, description)
  	@author = author
  	@title = title
  	@description = description
  	@user_checked_out
  	@date_checked_out
  	@due_date
  	@status = "available" # available - DONE, checked out - DONE, overdue or lost -- under what scenario would it be lost? -- no user has it and no library has it
  							# overdue sees like it would need to be assigned each day - but could assign it on an attempt to check out
  							# could also run everywhere check status is used
  end
end