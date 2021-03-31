require "./controller"

class Router
  def call(env)
    path = env["REQUEST_PATH"]
    params = Rack::Request.new(env).params

    controller = Controller.instance
    controller.params = params

    case path
    when "/"
      controller.index
    when "/add"
      controller.add_cart(params["fruit"])
    when "/add_select"
      controller.add_cart(params["fruit_select"])
    when "/empty_cart"
      controller.empty_cart
    else
      controller.not_found
    end
  end
end
