require "tilt"
require "erb"
require "./controller"

class Router
  def call(env)
    path = env["REQUEST_PATH"]
    params = Rack::Request.new(env).params

    @controller = Controller.instance

    case path
    when "/"
      template = Tilt.new("index.html.erb")
      [200, { "Content-Type" => "text/html" }, template.render(
        self,
        product_list: @controller.product_list,
        cart_total: @controller.cart_total,
        cart_list: @controller.cart_list
      )]
    when "/add_product"
      @controller.add_cart(params["fruit"])
      [302, { "Location" => "/" }, []]
    else
      template = Tilt.new("not_found.html.erb")
      [404, { "Content-Type" => "text/html" }, template.render]
    end
  end
end
