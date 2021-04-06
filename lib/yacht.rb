class Yacht

    def self.dbts
        @dbts ||= SQLite3::Database.new "./topsails.db"
        @dbts.results_as_hash = true
        @dbts
    end

    def self.all
        dbts.execute("SELECT name, description, price, taxation, year, width, length FROM yachts").map do |row|
            self.new(name:row["name"], 
                description:row["description"], 
                price:row["price"], 
                taxation:row["taxation"], 
                year:row["year"], 
                width:row["width"], 
                length:row["length"])
        end
    end

    def self.get_by_name(name)
        boats = dbts.execute("SELECT (name, description, price, taxation, year, width, length) FROM yachts WHERE name='#{name}' LIMIT 1").first
        self.new(name:boats["name"], 
                description:boats["description"], 
                price:boats["price"], 
                taxation:boats["taxation"], 
                year:boats["year"], 
                width:boats["width"], 
                length:boats["length"])
    end

    def self.add_boats(boat_title:, boat_descriptions:, boat_prices_value:, boat_prices_taxe:, boat_year:, boat_width:, boat_length:)
        boat_title.length.times.with_index do |i|
            dbts.execute(
                "INSERT OR IGNORE INTO yachts(name, description, price, taxation, year, width, length)
                VALUES(?,?,?,?,?,?,?)", 
                boat_title[i],boat_descriptions[i],boat_prices_value[i],
                boat_prices_taxe[i],boat_year[i],boat_width[i],boat_length[i]
            )
        end
    end

    attr_reader :name, :description, :price, :taxation, :year, :width, :length
    def initialize(name:, description:, price:, taxation:, year:, width:, length:)
        @name = name;
        @description = description;
        @price = price;
        @taxation = taxation;
        @year = year;
        @width = width;
        @length = length;
    end

end