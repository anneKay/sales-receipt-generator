class FileReader
  attr_reader :items

  def initialize(filename)
    @filename = filename
    @items = read_file
  end

  def read_file

    file_path = "input/#{@filename}"
    File.read(file_path).split("\n") if !@filename.strip.empty? && File.exist?(file_path)

  end

end
