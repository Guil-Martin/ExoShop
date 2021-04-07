class Yacht

    def self.dbts
        @dbts ||= SQLite3::Database.new "./topsails.db"
        @dbts.results_as_hash = true
        @dbts
    end

    def self.all
        dbts.execute("SELECT name, description, condition, price, taxation, year, width, length FROM yachts").map do |row|
            self.new(row)
        end
    end

    def self.get_by_name(name)
        boats = dbts.execute("SELECT (name, description, condition, price, taxation, year, width, length) FROM yachts WHERE name='#{name}' LIMIT 1").first
        self.new(boats)
    end

    def self.add_yachts(data)
        dbts.execute(
            "INSERT OR IGNORE INTO yachts VALUES (:name, :description, :condition, :price, :taxation, :year, :width, :length)",
            data)
    end

    attr_reader :data # , :description, :condition, :price, :taxation, :year, :width, :length
    def initialize(data)
        @data = data
    end

end