# List of items available, validation of products and discounts
# than adding items to cart
class Product
  attr_reader :name, :product

  def initialize()
    @products_french = {
      "pomme" => 100,
      "banane" => 150,
      "cerise" => 75,
      "ananas" => 230
    }
    @products_italian = {
      "mele" => 100,
      "banana" => 150,
      "ciliegia " => 75,
      "ananas " => 230
    }
    @products_english = {
      "apple" => 100,
      "banana" => 150,
      "cherry" => 75,
      "pineapples" => 230
    }

    @language = "french"
    @product = @products_french
  end

  def entry(name, cart)
    if @products_french[name]
      @product = @products_french
      @language = "french"
      add_total(name, cart)
    elsif @products_english[name]
      @product = @products_english
      @language = "english"
      add_total(name, cart)
    elsif @products_italian[name]
      @product = @products_italian
      @language = "italian"
      add_total(name, cart)
    else
      p "No such product in available products"
    end
  end

  def add_total(name, cart)
    cart << name
    cart.total += @product[name]
    p cart.total
    discount(cart)
  end

  def discount(cart)
    case @language
    when "french"
      cart.total -= 20 if cart.items["cerise"]&.even?
      cart.total -= @product["banane"] if cart.items["banane"]&.even?
    when "english"
      cart.total -= @product["apple"] if (cart.items["apple"]&.%3).zero?
    when "italian"
      cart.total -= 50 if cart.items["mele"]&.even?
    end
  end
end
