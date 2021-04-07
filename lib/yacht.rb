class Yacht

    def self.dbts
        @dbts ||= SQLite3::Database.new "./topsails.db"
        @dbts.results_as_hash = true
        @dbts
    end

    def self.all
        dbts.execute("SELECT name, description, condition, price, taxation, year, width, length FROM yachts").map do |row|
            self.new(name:row["name"], 
                description:row["description"], 
                condition:row["condition"],
                price:row["price"], 
                taxation:row["taxation"], 
                year:row["year"], 
                width:row["width"], 
                length:row["length"])
        end
    end

    def self.get_by_name(name)
        boats = dbts.execute("SELECT (name, description, condition, price, taxation, year, width, length) FROM yachts WHERE name='#{name}' LIMIT 1").first
        self.new(name:boats["name"], 
                description:boats["description"], 
                condition:boats["condition"],
                price:boats["price"], 
                taxation:boats["taxation"], 
                year:boats["year"], 
                width:boats["width"], 
                length:boats["length"])
    end

    def self.add_yachts(data)
        dbts.execute(
            "INSERT OR IGNORE INTO yachts VALUES (:name, :description, :condition, :price, :taxation, :year, :width, :length)",
            data)
    end

    attr_reader :name, :description, :condition, :price, :taxation, :year, :width, :length
    def initialize(name:, description:, condition:, price:, taxation:, year:, width:, length:)
        @name = name;
        @description = description;
        @condition = condition;
        @price = price;
        @taxation = taxation;
        @year = year;
        @width = width;
        @length = length;
    end

end