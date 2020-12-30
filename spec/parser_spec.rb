require_relative '../lib/parser'

describe Parser do

  before :each do
    def parser(item)
      parser = Parser.new(item)
      details = parser.build_item_details
    end
  
  end

  it "should take in a valid item list and return a valid hash object" do
    valid_item = "2 book at 12.49"
    expect(parser(valid_item)).to be_an_instance_of(Hash)
    expect(parser(valid_item)).to have_key(:quantity)
    expect(parser(valid_item)).to have_key(:price)
    expect(parser(valid_item)).to have_key(:name)
    expect(parser(valid_item)).to include(:name => "book", :price => 12.49, :quantity => 2)
  end

  it "should not return valid format if input does not include 'at' " do
    item = "2 book 12.49"
    expect(parser(item)).to be_falsey
  end

  it "should not return valid format if price is not digits" do
    item = "2 book at twelve.nine"
    expect(parser(item)).to be_falsey
  end

  it "should not return valid format if quantity is not digits" do
    item = "two book at 12.49"
    expect(parser(item)).to be_falsey
  end
  
end
