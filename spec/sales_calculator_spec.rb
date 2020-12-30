require_relative '../lib/sales_calculator'
require_relative '../lib/parser'
require_relative '../lib/item'
require_relative '../lib/sales_tax'


describe SalesCalculator do

  before :each do
    def calculator(item)
      sales_calculator = SalesCalculator.new(item).sales_details
    end
  end

  it "should return a hash with items, total cost of all items and sales tax" do
    item = ["2 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"]
    expect(calculator(item)).to be_an_instance_of(Hash)
    expect(calculator(item)).to have_key(:list)
    expect(calculator(item)).to have_key(:total_cost)
    expect(calculator(item)).to have_key(:sales_tax)
  end

  it "should return the 0 as tax payable for essential items" do
    item = ["2 book at 12.49"]
    expect(calculator(item)[:sales_tax]).to eq(0)
  end

  it "should return the right tax amount for imported goods" do
    item = ["1 imported bottle of perfume at 47.50"]
    expect(calculator(item)[:sales_tax]).to eq (7.15)
  end

  it "should return the right tax amount for an item that is both an essential and imported good" do
    item = ["1 imported box of chocolates at 10.00"]
    expect(calculator(item)[:sales_tax]).to eq (0.5)
  end

  it "should return the accurate total cost for a product with tax inclusive" do
    item = ["1 imported bottle of perfume at 47.50"]
    expect(calculator(item)[:list].first[:cost]).to eq (54.65)
  end

  it "should return the correct total amount for all products" do
    items = ["2 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"]
    expect(calculator(items)[:total_cost]).to eq (42.32)
  end

  it "should return the correct sales tax for all products" do
    items = ["2 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"]
    expect(calculator(items)[:sales_tax]).to eq (1.50)
  end

  it "should generate receipt for only valid input" do
    item = ["1 imported bottle of perfume at 47.50", "1 imported box of chocolates 10.00"]
    number_of_input_products = item.size
    number_of_output_products = calculator(item)[:list].size
    expect(number_of_input_products).not_to eq (number_of_output_products)
  end



end
