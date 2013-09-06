# 
# 
class Book
  attr_accessor :author, :title, :description, :user_checked_out

  def initialize(author, title, description)
  	@author = author
  	@title = title
  	@description = description
  	@user_checked_out
  end
end