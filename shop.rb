require "./lib/product"
require "./lib/cart"

# class Shop

#   def initialize
#     @product = Product.new
#     @cart = Cart.new
#   end

#   def get_cart_content
#     @cart.cart_list
#   end
  
#   def get_total
#     @cart.display_total
#   end

# end

product = Product.new
cart = Cart.new

ARGF.each do |entry|
  entry = entry.chomp.downcase
  entries = entry.split(",")

  case entry
  when "quit"
    break
  when "cart"
    p cart.cart_list
  else
    entries.each do |ent|
      ent.strip!
      product.entry(ent, cart)
    end
  end

  cart.display_total
end