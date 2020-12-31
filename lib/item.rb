class Item
  attr_reader :name

  def initialize
  end

  def is_essential?(name)
    essentials.any? { |essential| name.include? essential }
  end

  def is_imported?(name)
    name.include? 'imported'
  end

  private

    def essentials
      ["headache pills", "book", "books", "chocolate bar", "chocolates"]
    end

end
