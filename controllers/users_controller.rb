require_relative "../controller"

require_relative "../models/user"

class UsersController < Controller
  def index
    User.all.each do |user|
      response.write "<p> #{user.name}</p>"
    end
  end

  def show

  end
end