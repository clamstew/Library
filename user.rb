# 
# 
class User
  attr_accessor :name, :username, :address, :phone, :num_books_checked_out

  def initialize(name, username, address, phone)
  	@name = name
  	@username = username
  	@address = address
  	@phone = phone
  	@num_books_checked_out = 0
  end
end