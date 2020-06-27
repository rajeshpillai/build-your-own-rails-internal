require_relative "./connection_adapter"

module ActiveRecord
  class Base 
    @@connection = SqliteAdapter.new
  
    def initialize(attributes)
      @attributes = attributes
    end

    def method_missing(name, *args)
      #puts self.class
      if self.class.columns.include?(name)
        @attributes[name]
      else
        super
      end
    end
  
    def self.find(id)
      puts "finding by #{id}"
      find_by_sql("SELECT * FROM #{table_name} WHERE id = #{id.to_i} LIMIT 1").first
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

    def self.table_name
      name.downcase + "s"   # => "user" => users
    end
  
  end
end

