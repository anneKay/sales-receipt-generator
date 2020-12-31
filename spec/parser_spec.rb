require_relative '../lib/parser'
require_relative '../lib/item'

describe Parser do

  before :each do
    def parser(list)
      item_type = Item.new()
      parser = Parser.new(list, item_type)
      details = parser.build_item_list
    end
  
  end

  it "should take in an array of valid valid item list and return a valid hash object" do
    valid_list = ["2 book at 12.49", "1 music CD at 14.99"]
    expect(parser(valid_list)).to be_an_instance_of(Array)
    expect(parser(valid_list)).to include(include(:quantity=>2))
    expect(parser(valid_list)).to include(include(:quantity=>1))
    expect(parser(valid_list)).to include(include(:price=>12.49))
    expect(parser(valid_list)).to include(include(:price=>14.99))
    expect(parser(valid_list)).to include(include(:name=>"book"))
    expect(parser(valid_list)).to include(include(:name=>"music CD"))
    expect(parser(valid_list)).to include(include(:essential=>true))
    expect(parser(valid_list)).to include(include(:imported=>false))
  end

  it "should not return an empty list if input does not include 'at' " do
    item = ["2 book 12.49"]
    expect(parser(item)).to eq([])
  end

  it "should not return valid format if price is not digits" do
    item = ["2 book at twelve.nine"]
    expect(parser(item)).to eq([])
  end

  it "should not return valid format if quantity is not digits" do
    item = ["two book at 12.49"]
    expect(parser(item)).to eq([])
  end

  it "should return only valid items in a list" do
    item = ["1 imported bottle of perfume at 47.50", "1 imported box of chocolates 10.00"]
    list_size = item.size
    expect(parser(item).size).not_to eq (list_size)
  end

end
