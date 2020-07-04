require_relative "../controller"
# require_relative "../models/user.rb"

class UsersController < Controller

  def index
    # p User
    users = User.all.each do |user|
       "<p> #{user.name}</p>"
    end
    response.write users
    @rendered = true
  end

  def show
    @user = User.find(request["id"])
  end
end