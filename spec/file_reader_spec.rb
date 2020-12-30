require_relative '../lib/file_reader'

describe FileReader do

  it "should take the sample file and return an array of items" do
    reader = FileReader.new('sample_input_2.txt')
    expect(reader.items).to be_an_instance_of(Array)
  end
  
  it "should return a falsey value if filename is incorrect" do
    reader = FileReader.new('sample_input.txt')
    expect(reader.items).to be_falsey
  end
end
