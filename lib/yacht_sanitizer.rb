class YachtSanitizer

    def initialize (name:,description:,price:,year:,width:,length:)

        p name
        p description
        p price
        p year
        p width
        p length

        @data = {}
        @data["name"] = name
        @data["condition"] = ["très bon", "bon", "excellent"].find {|k| description.include?(k)}
        @data["description"] = description.split(" en").first.strip
        seperated_price = price.tr(" ", "").scan(/\d+|\D+/)
        @data["price"] = seperated_price[0]&.to_i
        @data["taxation"] = ["ttc", "ht"].find {|k| seperated_price[1]&.include?(k)} 
        @data["year"] = year.to_i
        @data["width"] = width.delete_suffix("m").to_f
        @data["length"] = length.delete_suffix("m").to_f
        
    end

    def to_h
        @data
    end

end