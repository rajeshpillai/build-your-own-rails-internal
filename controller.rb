require "erb"

class Controller
  attr_accessor :request, :response

  def render (action)
    # response.write action
    response.write render_to_string(action)
    @rendered = true
  end

  def rendered?
    @rendered
  end

  def render_to_string(action)
    path = template_path(action)
    p self
    ERB.new(File.read(path)).result(binding)
  end

  def template_path(action)
    File.dirname(__FILE__) + "/views/#{controller_name}/#{action}.html.erb"
  end

  def controller_name
    puts "class.name : ", self.class.name
    self.class.name[/^(\w+)Controller$/, 1].downcase   # home
  end

end
