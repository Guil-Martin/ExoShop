# List of added items and total
class Cart
  attr_reader :items
  attr_accessor :total

  def self.instance
    @instance ||= Cart.new
  end

  def initialize
    @items = Hash.new(0)
    @total = 0
  end

  def cart_list
    list = []
    @items.each do |k, v|
      list << "#{k} : #{v}"
    end
    list
  end

  def display_total
    euro, centime = @total.divmod(100)
    "Prix total : #{euro},#{centime}"
  end

  def <<(name)
    @items[name] += 1
    p @items
  end
end
