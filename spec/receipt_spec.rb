require_relative '../lib/receipt'

describe Receipt do

  before do
    def receipt
      details = {
        list: [
          {:quantity => 1, :price => 14.99, :name => "music cd", :cost => 16.49}
        ],
        total_cost: 17.34,
        sales_tax: 1.5
      }
      receipt = Receipt.new(details).print_receipt
    end

  end

  it "should take in a sales details and print receipt" do
    expect do 
      (receipt)
    end.to output("1 music cd: 16.49\nSales Tax: 1.50\nTotal: 17.34\n").to_stdout
  end

end
