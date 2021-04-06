require "pry"
require "tilt"
require "erb"
require "json"
require "sqlite3"

require "./lib/product"
require "./lib/cart"

require "./lib/yacht"

class Controller
  attr_accessor :params

  def self.instance
    @instance ||= Controller.new
  end

  def product
    @product ||= Product.instance
  end

  def cart
    @cart ||= Cart.instance
  end

  def index
    @product_list = product_list
    @cart_total = cart_total
    @cart_list = cart_list

    # @cart_list = @cart_list.map { |l| {}}

    # render({product_list: @product_list, cart_total: @cart_total, cart_list: @cart_list})
    render_json({ product_list: @product_list, cart_total: @cart_total, cart_list: @cart_list })
  end

  def render(params, code = 200)
    file = caller_locations(1, 1)[0].label
    template = Tilt.new("./lib/views/#{file}.html.erb")
    [
      code,
      { "Content-Type" => "text/html" },
      template.render(self, params)
    ]
  end

  def empty_cart
    cart.clear
    redirect("/")
  end

  def not_found
    render({}, 404)
  end

  def add_cart(products)
    get_product_data
    products.split(",").each do |fruit|
      fruit.strip!
      fruit.capitalize!
      if @data.key?(fruit)
        product.entry(fruit, @data[fruit], cart)
      else
        p "No such product in available products"
      end
    end
    redirect("/")
  end

  def boats
    @yachts = Yacht::all

    # binding.pry
    
    render({yachts: @yachts})
  end

  private

  def product_list
    get_product_data
  end

  def cart_list
    cart.cart_list
  end

  def cart_total
    cart.display_total
  end

  def get_product_data
    @db = SQLite3::Database.open "myshopDB.db"
    @db.results_as_hash = true

    @data = {}
    @db.execute("SELECT name, price FROM products").map do |row|
      @data[row["name"]] = row["price"]
    end

    @data
  rescue SQLite3::Exception => e
    puts "Exception occurred"
    puts e
  ensure
    @db&.close
  end

  def render_json(params, code = 200)
    [
      code,
      { "Content-Type" => "application/json" },
      [params.to_json]
    ]
  end

  def redirect(to)
    [302, { "Location" => to }, []]
  end
end
