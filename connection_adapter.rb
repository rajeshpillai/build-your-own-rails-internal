class ConnectionAdapter
  def execute (sql) 
    @db.execute(sql)
  end

  def columns(table_name) 
    @db.table_info(table_name).map { |info| info["name"].to_sym}
  end
end

# we will implement this
class SqliteAdapter < ConnectionAdapter
  def initialize
    require "sqlite3"

    @db = SQLite3::Database.new(File.dirname(__FILE__) + "/db/app.db")

  end

end

# futer
class MySqlAdapter < ConnectionAdapter
end