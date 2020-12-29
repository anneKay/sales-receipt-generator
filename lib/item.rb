class Item
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def is_essential?
    essentials.any? { |essential| @name.include? essential }
  end

  def is_imported?
    @name.include? 'imported'
  end

  private

    def essentials
      ["headache pills", "book", "books", "chocolate bar", "chocolates"]
    end

end
