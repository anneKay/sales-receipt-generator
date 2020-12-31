require_relative '../lib/sales_calculator'
require_relative '../lib/parser'
require_relative '../lib/item'
require_relative '../lib/sales_tax'


describe SalesCalculator do

  before :each do
    def calculator(item)
      sales_tax = SalesTax.new()
      sales_calculator = SalesCalculator.new(item, sales_tax).sales_details
    end
  end

  it "should return a hash with items, total cost of all items and sales tax" do
    items = [{:quantity=>1, :price=>27.99, :name=>"imported bottle of perfume", :essential=>false, :imported=>true}]
    expect(calculator(items)).to be_an_instance_of(Hash)
    expect(calculator(items)).to have_key(:list)
    expect(calculator(items)).to have_key(:total_cost)
    expect(calculator(items)).to have_key(:sales_tax)
  end

  it "should return 0 as tax payable for essential items" do
    items = [{:quantity=>2, :price=>24.98, :name=>"book", :essential=>true, :imported=>false}]
    expect(calculator(items)[:sales_tax]).to eq(0)
  end

  it "should return the right tax amount for imported goods" do
    items = [{:quantity=>1, :price=>47.50, :name=>"imported bottle of perfume", :essential=>false, :imported=>true}]
    expect(calculator(items)[:sales_tax]).to eq (7.15)
  end

  it "should return the right tax amount for an item that is both an essential and imported good" do
    items = [{:quantity=>1, :price=>10.00, :name=>"imported box of chocolates", :essential=>true, :imported=>true}]
    expect(calculator(items)[:sales_tax]).to eq (0.5)
  end

  it "should return the accurate total cost for an imported product with tax inclusive" do
    items = [{:quantity=>1, :price=>47.50, :name=>"1 imported bottle of perfume", :essential=>false, :imported=>true}]
    expect(calculator(items)[:list].first[:cost]).to eq (54.65)
  end

  it "should return the accurate total cost for a non essential product with tax inclusive" do
    items = [{:quantity=>1, :price=>18.99, :name=>"1 bottle of perfume", :essential=>false, :imported=>false}]
    expect(calculator(items)[:list].first[:cost]).to eq (20.89)
  end

  it "should return the correct total amount for all products" do
    items = [ {:quantity=>2, :price=>12.49, :name=>"book", :essential=>true, :imported=>false},
              {:quantity=>1, :price=>14.99, :name=>"music CD", :essential=>false, :imported=>false},
              {:quantity=>1, :price=>0.85, :name=>"chocolate bar", :essential=>true, :imported=>false}
            ]
    expect(calculator(items)[:total_cost]).to eq (42.32)
  end

  it "should return the correct sales tax for all products" do
    items = [ {:quantity=>2, :price=>12.49, :name=>"book", :essential=>true, :imported=>false},
      {:quantity=>1, :price=>14.99, :name=>"music CD", :essential=>false, :imported=>false},
      {:quantity=>1, :price=>0.85, :name=>"chocolate bar", :essential=>true, :imported=>false}
    ]
    expect(calculator(items)[:sales_tax]).to eq (1.50)
  end

end
