require_relative "../controller"

class HomeController < Controller
  def index
    # response.write "Welcome HOME!!"
    @message = "This is from controller"
    # render :index
    
  end

end