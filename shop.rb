require "./lib/product"
require "./lib/cart"

product = Product.new
cart = Cart.new
total = 0

ARGF.each do |entry|

    entry = entry.chomp.downcase
    entries = entry.split(",")

    case entry
    when "quit"
        break
    when "cart"
        p cart.cartList()
    else
        for ent in entries
            ent.strip!
            product.entry(ent, cart)
        end
    end

    cart.displayTotal

end