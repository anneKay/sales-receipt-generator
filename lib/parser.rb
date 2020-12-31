class Parser
  attr_reader :items, :item_type

  def initialize(items, item_type)
    @items = items
    @item_type = item_type
  end

  def build_item_list
    valid_items.map {|item| build_item_hash(get_item_details(item))}
  end

  private

    def build_item_hash(item_details)
      { quantity: get_quantity(item_details), 
        price: get_price(item_details), 
        name: get_name(item_details), 
        essential: is_essential?(get_name(item_details)),
        imported: is_imported?(get_name(item_details)) }
    end

    def is_essential?(name)
      item_type.is_essential?(name)
    end

    def is_imported?(name)
      item_type.is_imported?(name)
    end

    def valid_items
      items&.select { |item| is_valid_format?(get_item_details(item)) }
    end

    def is_valid_item?(item_details)
      item_details.include? 'at'
    end

    def get_item_details(item)
      item&.strip.split(" ")
    end

    def is_valid_number?(number)
      true if Float(number) rescue false
    end

    def get_price(item_details)
      price = item_details.last
      is_valid_number?(price) ? price.to_f : nil
    end

    def get_name(item_details)
      last_name_index = item_details.index("at") - 1
      item_details[1..last_name_index].join(" ")
    end

    def get_quantity(item_details)
      quantity = item_details.first
      is_valid_number?(quantity) ? quantity.to_i : nil
    end

    def is_valid_format?(item_details)
      is_valid_item?(item_details) && get_price(item_details) && get_quantity(item_details)
    end

end
