# 
# 
class User
  attr_accessor :name, :username, :address, :phone

  def initialize(name, username, address, phone)
  	@name = name
  	@username = username
  	@address = address
  	@phone = phone
  end
end