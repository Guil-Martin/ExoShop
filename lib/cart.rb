# List of added items and total
class Cart
  attr_reader :items
  attr_accessor :total

  def initialize
    @items = Hash.new(0)
    @total = 0
  end

  def cart_list()
    puts "Panier :"
    @items.each do |k, v|
      puts "#{k} : #{v}"
    end
  end

  def display_total()
    euro, centime = @total.divmod(100)
    puts "Prix total : #{euro},#{centime} €"
  end

  def <<(name)
    @items[name] += 1
    p @items
  end
end
