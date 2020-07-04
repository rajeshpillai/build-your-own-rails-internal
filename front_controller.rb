require_relative "./controller"


class FrontController
  def call (env)
    puts "Front controller called..."
    request = Rack::Request.new(env)
    response = Rack::Response.new

    controller_name, action_name = route(request.path_info)

    puts controller_name, action_name

    controller_class = load_controller_class(controller_name)
    controller = controller_class.new
    controller.request = request
    controller.response = response

    controller.send(action_name)
    controller.render(action_name)  unless controller.rendered?
    
    response.finish

  end

  def load_controller_class(name)
    require_relative "./controllers/#{name}_controller"
    class_name = name.capitalize + "Controller"  # HomeController
    Object.const_get class_name
  end

  def route(path)
    _, controller_name, action_name =  path.split("/")   # "", "home", "index"
    [controller_name || "home", action_name || "index"]
  end
end