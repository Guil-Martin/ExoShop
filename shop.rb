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

    p cart.total
    cart.displayTotal

end




###### objects method


# apples = Product.new("Pommes", 100)
# bananes = Product.new("Bananes", 150)
# ananas = Product.new("Ananas", 145)
# cerises = Product.new("Cerises", 75)

# productArr = []
# productArr << apples
# productArr << ananas
# productArr << bananes
# productArr << cerises

# p productArr

# for fruit in productArr
#     puts "Prix du produit #{fruit.name} : #{fruit.priceEuro}"
# end

# found = productArr.find { |e| e.name == "Pommes"}
# puts found != nil
######

###### CSV method

# data = CSV.generate do |csv|
#     csv << [:pommes, 100]
#     csv << [:bananes, 150]
#     csv << [:cerises, 75]
# end
# File.write("products.csv", data)

# table = CSV.parse(File.read("products.csv"), headers: true)

# data_file = 'products.csv'
# data = []
# CSV.foreach(data_file, headers: true) do |row|
#   data << row.to_hash
# end

# data.each_with_index do |row, i|
#     p row['name']
#     p row['price'].to_i
#     p i
# end




# for ele in table.with_index { |i|
#     p table[i]["name"]
#     p table[i]["price"]
# }

######

# nums = [0, 1, 2]
# nums.each_with_index do |num, i| 
#     p num.to_s + "i - " + i.to_s
# end

# productArr.find
# productsFrench = {
#     "pomme" => 100,
#     "banane" => 150, 
#     "cerise" => 75,
#     "ananas" => 230
# }
# productsItalian = {
#     "mele" => 100,
#     "banana" => 150, 
#     "ciliegia " => 75,
#     "ananas " => 230
# }
# productsEnglish = {
#     "apple" => 100,
#     "banana" => 150, 
#     "cherry" => 75,
#     "pineapples" => 230
# }

# $language = "french"
# $products = productsFrench

# def translation(entry)
#     return "pommes" if entry == "Manzana" || entry == "apples"
#     return "bananes" if entry == "platanos" || entry == "bananas"
#     return "cerises" if entry == "cereza" || entry == "cherries"        
#     entry
# end

# def added(prod, name)
#     case $language        
#     when "french"
#         euro, centime = prod.divmod(100)
#         puts name.capitalize + " ajouté, prix : #{euro},#{centime} €"
#     when "english"
#         dollar, cent = prod.divmod(100)
#         puts name.capitalize + " added, price : #{dollar},#{cent} $"
#     when "italian"
#         euro, centesimo  = prod.divmod(100)
#         puts name.capitalize + " aggiunto, prezzo : #{euro},#{centesimo } $"
#     end
# end

# def discount(entry, cart, total)
#     case $language
        
#     when "french"
#         if entry == "cerises" && cart[entry] % 2 == 0
#             total -= 20
#             puts "Reduction pour 2 cerises : 20c"
#         elsif entry == "bananes" && cart[entry] % 2 == 0
#             total -= 20
#             puts "Une banane offerte!"
#         end
#     when "english"

#     when "italian"

#     end
#     return total
# end

# def cartList(cart, total)
#     puts "Panier :"
#     cart.each do |k, v|
#         puts "#{k} : #{v}"
#     end
#     displayTotal(total)
# end

# def displayTotal(total)
#     euro, centime = total.divmod(100)  
#     puts "Prix total : #{euro},#{centime} €"
# end
    
# p 'Language : '
# print "French | English | Italian"
# ARGF.each do |entry|
#     case entry.chomp.downcase
#     when "fr" || "french"
#         $language = "french"
#         $products = productsFrench
#         break
#     when "it" || "italian"
#         $language = "italian"
#         $products = productsItalian 
#         break
#     when "en" || "english"
#         $language = "english"
#         $products = productsEnglish 
#         break
#     else
#         p "Inconnu | Unknown | Sconosciuto"
#         p "French | English | Italian"
#     end
# end

# print 'Produit recherché : '
# cart = {}
# total = 0

# ARGF.each do |entry|

#     entry = entry.chomp.downcase
#     entry = translation(entry)
#     entries = entry.split(",")

#     case entry
#     when "quit"
#         break
#     when "cart"
#         cartList(cart, total)
#     else
#         for ent in entries
#             ent.strip!
#             if $products.key?(ent)
#                 added($products[ent], ent)                
#                 total += $products[ent]    
#                 cart[ent] = cart[ent] ? cart[ent] + 1 : 1
#                 total = discount(ent, cart, total)
#                 displayTotal(total)
#             else
#                 puts "Le produit n'existe pas. Produits disponibles :"
#                 $products.each do |k, v|
#                     puts k
#                 end
#             end    
#         end
#     end

# end