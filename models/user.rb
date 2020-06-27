require_relative "../connection_adapter"

class User 
  @@connection = SqliteAdapter.new

  def initialize(attributes)
    @attributes = attributes
  end

  def id
    @attributes[:id]
  end

  def name
    @attributes[:name]
  end

  def self.find(id)
    # User.find(1)
    puts "finding by #{id}"
    find_by_sql("SELECT * FROM users WHERE id = #{id.to_i} LIMIT 1").first
  end

  def self.find_by_sql(sql) 
    rows = @@connection.execute(sql)
    results = []
    rows.map do |row|
      attributes = map_values_to_column(row)
      new(attributes)
    end
  end

  def self.map_values_to_column(values) 
    Hash[columns.zip(values)]
  end

  def self.columns
    @@connection.columns("users")
  end

end