require_relative '../lib/receipt'

describe Receipt do

  before do
    def receipt(details)
      receipt = Receipt.new(details).print_receipt
    end
  end

  it "should take in a sales details and print receipt" do
    details = { list: [{:quantity => 1, :price => 14.99, :name => "music cd", :cost => 16.49}],
                total_cost: 17.34,
                sales_tax: 1.5 }
    expect do 
      (receipt(details))
    end.to output("1 music cd: 16.49\nSales Taxes: 1.50\nTotal: 17.34\n").to_stdout
  end

  it "should return an falsey value if list is empty" do
    details = { list: [], total_cost: 0.00, sales_tax: 0.00}
    expect(receipt(details)).to be_falsey
  end

end
