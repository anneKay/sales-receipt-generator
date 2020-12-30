require_relative '../lib/receipt'
require_relative '../lib/sales_calculator'
require_relative '../lib/file_reader'
require_relative '../lib/task_builder'
require_relative '../lib/parser'
require_relative '../lib/item'
require_relative '../lib/sales_tax'

describe TaskBuilder do

  before :each do
    def task_builder(filename)
      TaskBuilder.new(filename).print_receipt
    end
  end

  it "should return approprate error message if user provides wrong filename" do
    expect do 
      (task_builder('sample_input_'))
    end.to output("please check that your file name is correct and it's in the input folder\n").to_stdout
  end

  it "should return approprate error message if user provides does not add any sales details in the test file" do
    expect do 
      (task_builder('sample_input_4.txt'))
    end.to output("please check that you have added valid inputs in your test file\n").to_stdout
  end

  it "should print the right ouput for input 1" do
    expect(task_builder('sample_input_1.txt')).to eq (["2 book: 24.98", "1 music cd: 16.49", "1 chocolate bar: 0.85", "Sales Tax: 1.50", "Total: 42.32"])
  end

  it "should print the right ouput for input2" do
    expect(task_builder('sample_input_2.txt')).to eq (["1 imported box of chocolates: 10.50", "1 imported bottle of perfume: 54.65", "Sales Tax: 7.65", "Total: 65.15"])
  end
  it "should print the right ouput for input3" do
    expect(task_builder('sample_input_3.txt')).to eq (["1 imported bottle of perfume: 32.19", "1 bottle of perfume: 20.89", "1 packet of headache pills: 9.75", "3 imported boxes of chocolates: 35.55", "Sales Tax: 7.90", "Total: 98.38"])
  end
end