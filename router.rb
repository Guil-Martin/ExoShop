require "./lib/controller"

class Router
  def call(env)
    path = env["REQUEST_PATH"]
    req = Rack::Request.new(env)
    body = req.body.gets
    params = {}

    params.merge!(body ? JSON.parse(body) : {})

    # params.merge()

    controller = Controller.instance
    controller.params = params

    case path
    when "/"
      controller.index
    when "/add"
      # binding.pry
      p params
      p params["fruit"]
      controller.add_cart(params["fruit"])
    when "/empty_cart"
      controller.empty_cart
    else
      controller.not_found
    end
  end
end
