require_relative "../controller"

class HomeController < Controller
  def index
    response.write "Welcome HOME!!"
  end
end