class FileReader
  attr_reader :filename, :items

  def initialize(filename)
    @filename = filename
    @items = read_file
  end

  def read_file
    file_path = "input/#{filename}"
    File.read(file_path).split("\n") if !filename&.strip.to_s.empty? && File.exist?(file_path)
  end

end
