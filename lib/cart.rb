class Cart
    
    attr_reader :items
    attr_accessor :total

    def initialize()
        @items = {}
        @total = 0
    end

    def cartList()
        puts "Panier :"
        @items.each do |k, v|
            puts "#{k} : #{v}"
        end
    end

    def displayTotal()
        euro, centime = @total.divmod(100)  
        puts "Prix total : #{euro},#{centime} €"
    end

    def <<(name)
        @items[name] = @items[name] ? @items[name] + 1 : 1
        p @items
    end
    

end