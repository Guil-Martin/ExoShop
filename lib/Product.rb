# List of items available, validation of products and discounts
# than adding items to cart
class Product
  attr_reader :name, :product

  def self.instance
    @instance ||= Product.new
  end

  def initialize()
    @product = {
      "pomme" => 100,
      "apple" => 100,
      "mele" => 100,
      "banane" => 150,
      "banana" => 150,
      "cerise" => 75,
      "cherry" => 75,
      "ciliegia " => 75,
      "ananas" => 230,
      "pineapples" => 230
    }
  end

  def entry(name, price, cart)
      cart << name
      cart.total += price
      discount(cart)
      p cart.total
  end

  private

  def discount(cart)
    #cart.total -= discount_cherry_fr(cart) + discount_banana_fr(cart) + discount_apple_en(cart) + discount_apple_it(cart)
    
    # build a hash with existing reduction, example :
    # reduction = [{type => "Pommes", quantity => 2, reduction => 100},
    #             {type => "Cerises", quantity => 2, reduction => 20}]
  
  end

  def discount_cherry_fr(cart)
    20 if cart.items["cerise"]&.even?
  end

  def discount_banana_fr(cart)
    @product["banane"] if cart.items["banane"]&.even?
  end

  def discount_apple_en(cart)
    @product["apple"] if (cart.items["apple"]&.% 3).zero?
  end

  def discount_apple_it(cart)
    cart.total -= 50 if cart.items["mele"]&.even?
  end
end

