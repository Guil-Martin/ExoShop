require "nokogiri"
require "open-uri"
require "sqlite3"
require "pry"
require "./lib/yacht"
require "./lib/yacht_sanitizer"

url = "https://greta-code-pizza.github.io/topsails/"
html = URI.open(url)
noko = Nokogiri::HTML(html)

noko.css(".card-boat .card-body").each do |ele|

    name = ele.css(".card-title").children.text
    description = ele.css(".card-text").children.text
    price = ele.css(".price").children.text

    properties = ele.css(".property")
    year = properties.first.css('.badge').text
    width = properties[1].css('.badge').text
    length = properties.last.css('.badge').text

    # binding.pry

    data = 
        YachtSanitizer.new(
        name:name, 
        description:description,
        price:price,
        year:year, 
        width:width, 
        length:length).to_h

    p data

    Yacht::add_yachts(data)

end

# h3 = noko.css(".container h3")
# p noko.xpath("//character")

# boat_titles = noko.css(".card-boat .card-body .card-title").map(&:text)
# boat_descriptions = noko.css(".card-boat .card-body .card-text").map(&:text)
# boat_prices = noko.css(".card-boat .card-body .price").map(&:text)

# boat_prices_value = []
# boat_prices_taxe = []
# boat_prices.each do |ele|
#     ele = ele.tr(" ", "").scan(/\d+|\D+/)
#     boat_prices_value << ele[0].to_i
#     boat_prices_taxe << ele[1].tr("€", "")
# end

# Get boat properties
# boat_year = []
# boat_width = []
# boat_length = []

# noko.css(".card-boat .card-body").each do |ele|
#     Yacht::add_yacht(data)

#     ele.css(".property").each.with_index do |property, i|
#         case i
#         when 0
#             boat_year << property.css("span").last.text
#         when 1  
#             boat_width << property.css("span").last.text
#         when 2
#             boat_length << property.css("span").last.text
#         end
#     end
# end

# boat_year = boat_year.map(&:to_i)
# boat_width = boat_width.map {|w| w.delete_suffix("m").to_f}
# boat_length = boat_length.map {|l| l.delete_suffix("m").to_f}

# p boat_title
# p boat_descriptions
# p boat_conditions
# p boat_prices_value
# p boat_prices_taxe
# p boat_year
# p boat_width
# p boat_length


# Yacht::all.each do |boat|

#     p boat.name
#     p boat.description
#     p boat.price
#     p boat.taxation
#     p boat.year
#     p boat.width
#     p boat.length

# end