require_relative "qtest"
require_relative "../models/user"

class UserTest
  describe "Basic test" do 
    it "test initialize with attributes" do 
      user = User.new(:id => 1, :name => "Rajesh")
      is_equal 1, user.id
      is_equal "Rajesh", user.name
    end
  end

  it "maps values to columns" do
    columns = [:id, :name]
    values = [1, "Rajesh"]

    expected_attributes = {:id => 1, :name => "Rajesh"}

    attributes = {}
    columns.each_with_index do |column, i|
      attributes[column] = values[i]
    end

    is_equal expected_attributes , attributes
  end

  it "find user by id"  do
    user = User.find(1)

    is_equal 1, user.id
  
  end

  it "should get tablename from model" do
    is_equal "users", User.table_name
  end
end
