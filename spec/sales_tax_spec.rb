require_relative '../lib/sales_tax'

describe SalesTax do

  subject { SalesTax.new() }
  it "should return the correct basic sales tax amount" do
    expect(subject.basic_sales_tax(14.99)).to eq (1.5)
  end

  it "should return the correct import duty amount" do
    expect(subject.import_duty(14.99)).to eq (0.75)
  end

end
