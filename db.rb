require "sqlite3"

class Db
  def initialize
    begin
      @db = SQLite3::Database.new ":memory:"
      puts db.get_first_value "SELECT SQLITE_VERSION()"
    rescue SQLite3::Exception => e
      puts "Exception occurred"
      puts e
    ensure
      db.close if db
    end
  end

  def get_db
    @db = SQLite3::Database.new ":memory:"
  end
end
