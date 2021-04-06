require "nokogiri"
require "open-uri"
require "sqlite3"
require "pry"
require "./lib/yacht"

url = "https://greta-code-pizza.github.io/topsails/"
html = URI.open(url)
noko = Nokogiri::HTML(html)

h3 = noko.css(".container h3")
# p noko.xpath("//character")

boat_title = noko.css(".card-boat .card-body .card-title").map(&:text)
boat_descriptions = noko.css(".card-boat .card-body .card-text").map(&:text)
boat_prices = noko.css(".card-boat .card-body .price").map(&:text)

boat_prices_value = []
boat_prices_taxe = []
boat_prices.each do |ele|
    ele = ele.tr(" ", "").scan(/\d+|\D+/)
    boat_prices_value << ele[0].to_i
    boat_prices_taxe << ele[1].tr("€", "")
end

# Get boat properties
boat_year = []
boat_width = []
boat_length = []

noko.css(".card-boat .card-body").each do |ele|
    ele.css(".property").each.with_index do |property, i|
        case i
        when 0
            boat_year << property.css("span").last.text
        when 1  
            boat_width << property.css("span").last.text
        when 2
            boat_length << property.css("span").last.text
        end
    end
end

boat_year = boat_year.map(&:to_i)
boat_width = boat_width.map {|w| w.delete_suffix("m").to_f}
boat_length = boat_length.map {|l| l.delete_suffix("m").to_f}

# p boat_title
# p boat_descriptions
# p boat_prices_value
# p boat_prices_taxe
# p boat_year
# p boat_width
# p boat_length

# binding.pry

Yacht::add_boats(boat_title:boat_title, 
          boat_descriptions:boat_descriptions, 
          boat_prices_value:boat_prices_value,
          boat_prices_taxe:boat_prices_taxe, 
          boat_year:boat_year, 
          boat_width:boat_width, 
          boat_length:boat_length)

Yacht::all.each do |boat|

    p boat.name
    p boat.description
    p boat.price
    p boat.taxation
    p boat.year
    p boat.width
    p boat.length

end