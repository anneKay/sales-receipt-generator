require_relative '../lib/file_reader'

describe FileReader do

  before do
    @reader = FileReader.new('sample_input_2.txt')
  end

  it "should take the sample file and return an array of items" do
    expect(@reader.items).to be_an_instance_of(Array)
  end
  
end
