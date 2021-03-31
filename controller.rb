require "pry"
require "sqlite3"
require "./lib/product"
require "./lib/cart"

class Controller
  def initialize
    @product = Product.instance
    @cart = Cart.instance
  end

  def self.instance
    @instance ||= Controller.new
  end

  # def index
  #   @products = cash_register.products
  #   @total = cash_register.total
  #   @list = Product::all

  #   render({products: @products, total: @total, list: @list})
  # end
  # def render(params, code=200)
  #   file = caller_locations(1,1)[0].label
  #   template = Tilt.new("./lib/views/#{file}.html.erb")

  #   [
  #     code, 
  #     {"Content-Type" => "text/html"}, 
  #     template.render(
  #       self, 
  #       params
  #     )
  #   ]  
  # end
  # def redirect(to)
  #   [302, {'Location' => to}, []]
  # end
  
  def add_cart(products)
    get_product_data
    products.split(",").each do |fruit|
      fruit.strip!
      fruit.capitalize!

      if @data.key?(fruit)
        @product.entry(fruit, @data[fruit], @cart)
      else
        p "No such product in available products"
      end
    end
  end

  def product_list
    get_product_data
  end

  def cart_list
    @cart.cart_list
  end

  def cart_total
    @cart.display_total
  end

  def get_product_data
    begin
      @db = SQLite3::Database.open "myshopDB.db"
      @db.results_as_hash = true
      req = @db.execute "SELECT * from products"
      @data = {}
      req.each { |ele| @data[ele["name"]] = ele["price"] }
      @data
    rescue SQLite3::Exception => e
      puts "Exception occurred"
      puts e
    ensure
      @db&.close
    end
  end

end