require_relative "../models/user"

class UserTest
  def test_find
    user = User.find(1)
    p user
    puts user.id == 1

  end
end

userTest = UserTest.new
userTest.test_find
