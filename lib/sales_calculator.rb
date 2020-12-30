class SalesCalculator

  def initialize(items)
    @items = items
    @total_cost = 0.0
    @sales_tax = 0.0
    @item_list = []
  end

  def sales_details
    valid_items = sanitize_item_list
    valid_items&.map do |item|
      @item_list << generate_item_details(item)
      @total_cost += get_item_cost
      @sales_tax += compute_item_tax(@item_details)
    end
    build_item
  end

  private

    def build_item
      { list: @item_list, total_cost: @total_cost, sales_tax: @sales_tax }
    end

    def generate_item_details(item)
      item_details = item_details(item) 
      item_details[:cost] = get_item_cost

      item_details
    end

    def compute_item_tax(item_details)
      item = Item.new(item_details[:name])
      item_details[:quantity] * compute_tax(item, item_details)
    end

    def compute_tax(item, item_details)
      item_tax = 0
      sales_tax = SalesTax.new(item_details[:price])
      item_tax += sales_tax.basic_sales_tax unless item.is_essential?
      item_tax +=  sales_tax.import_duty if item.is_imported?

      item_tax
    end

    def generate_item_details(item)
      item_details = item_details(item) 
      item_details[:cost] = get_item_cost

      item_details
    end

    def compute_item_cost(tax)
      (@item_details[:quantity] * @item_details[:price]) + tax
    end
  
    def get_item_cost
      compute_item_cost(compute_item_tax(@item_details)).round(2)
    end
  
    def item_details(item)
      parser = Parser.new(item)
      @item_details = parser.build_item_details
    end

    def sanitize_item_list
      @items&.select{|item| item_details(item)}
    end
end
