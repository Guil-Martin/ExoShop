require "./lib/product"
require "./lib/cart"

require "pry"

product = Product.instance
cart = Cart.instance

p product
p cart

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
