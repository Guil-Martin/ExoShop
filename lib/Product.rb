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
        cart.total -= 20 if cart.items["cerise"] && cart.items["cerise"] % 2 == 0
        cart.total -= @product["banane"] if cart.items["banane"] && cart.items["banane"] % 2 == 0  
        cart.total -= @product["apple"] if cart.items["apple"] && cart.items["apple"] % 3 == 0
        cart.total -= 50 if cart.items["mele"] && cart.items["mele"] % 2 == 0
    end

end