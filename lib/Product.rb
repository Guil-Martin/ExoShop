class Product
    
    attr_reader :name, :product

    def initialize()

        @productsFrench = {
            "pomme" => 100,
            "banane" => 150, 
            "cerise" => 75,
            "ananas" => 230
        }
        @productsItalian = {
            "mele" => 100,
            "banana" => 150, 
            "ciliegia " => 75,
            "ananas " => 230
        }
        @productsEnglish = {
            "apple" => 100,
            "banana" => 150, 
            "cherry" => 75,
            "pineapples" => 230
        }

        @language = "french"
        @product = @productsFrench

    end

    def entry(name, cart)
        if @productsFrench[name]
            @product = @productsFrench
            @language = "french"
            add_total(name, cart)
        elsif @productsEnglish[name]
            @product = @productsEnglish
            @language = "english"
            add_total(name, cart)
        elsif @productsItalian[name]
            @product = @productsItalian
            @language = "italian"
            add_total(name, cart)
        else
            p "No such product in available products"
        end
    end

    def add_total(name, cart)
        cart << name
        cart.total += @product[name]
        discount(cart)
    end

    def discount(cart)
        case @language
        when "french"
            if cart.items["cerise"]
                return cart.total -= 20 if cart.items["cerise"] % 2 == 0
            end
            if cart.items["banane"]
                return cart.total -= @product["banane"] if cart.items["banane"] % 2 == 0
            end            
        when "english"
            return cart.total -= @product["apple"] if cart.items["apple"] % 3 == 0
        when "italian"
            return cart.total -= 50 if cart.items["mele"] % 2 == 0
        end
    end

    def price_euro(price)
        euro, centime = @price.divmod(100) 
        "#{euro},#{centime}€"
    end

    def price_dollar(price)
        euro, centime = @price.divmod(100) 
        "#{euro},#{centime}$"
    end

end