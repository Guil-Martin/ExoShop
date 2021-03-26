class Product
    
    def initialize(name, price)
        @name = name
        @price = price
    end

    def name
        @name
    end

    def price
        @price
    end

    def priceEuro
        euro, centime = @price.divmod(100) 
        "#{euro},#{centime}€"
    end

    def priceDollar
        euro, centime = @price.divmod(100) 
        "#{euro},#{centime}$"
    end

end