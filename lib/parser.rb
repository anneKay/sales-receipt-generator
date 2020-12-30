class Parser
  attr_reader :item_details

  def initialize(item)
    @item = item
    @item_details = get_item_details(@item)
  end

  def build_item_details
    if is_valid_format?
      { quantity: get_quantity, price: get_price, name: get_name }
    end
  end

  private

    def is_valid_item?
      @item_details.include? 'at'
    end

    def get_item_details(item)
      item&.downcase.strip.split(" ")
    end

    def is_valid_number?(number)
      true if Float(number) rescue false
    end

    def get_price
      price = @item_details.last
      is_valid_number?(price) ? price.to_f : nil
    end

    def get_name
      last_name_index = @item_details.index("at") - 1
      @item_details[1..last_name_index].join(" ")
    end

    def get_quantity
      quantity = @item_details.first
      is_valid_number?(quantity) ? quantity.to_i : nil
    end

    def is_valid_format?
      is_valid_item? && get_price && get_quantity
    end

end
