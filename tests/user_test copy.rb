require_relative "../models/user"

class UserTest
  def test_find
    user = User.find(1)
    p user
    puts user.id
    puts user.name

  end
end

userTest = UserTest.new
userTest.test_find
