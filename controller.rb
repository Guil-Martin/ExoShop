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

  def add_cart(products)
    begin
      @db = SQLite3::Database.open "myshopDB.db"
      @db.results_as_hash = true
      @req = @db.execute "SELECT * from products"
      p "request : #{@req}"

      @req.each do |ele|
        p "ele name : #{ele['name']}"
        p "ele price : #{ele['price']}"
      end

    rescue SQLite3::Exception => e
      puts "Exception occurred"
      puts e
    ensure
      @db&.close
    end

    products.split(",").each do |fruit|
        fruit.strip!
      @product.entry(fruit, @cart)
    end

  end

  def cart_list
    @cart.cart_list
  end

  def cart_total
    @cart.display_total
  end
end
