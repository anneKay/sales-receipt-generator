class SalesCalculator
  attr_reader :items

  def initialize(items, sales_tax)
    @items = items
    @total_cost = 0.0
    @total_tax = 0.0
    @item_list = []
    @sales_tax = sales_tax
  end

  def sales_details
    build_sales_details
    build_item
  end

  private

    def sales_item(item)
      update_list(item)
      increment_total_cost(item)
      increment_sales_tax(item)
    end

    def build_sales_details
      items&.map { |item| sales_item(item) }
    end

    def update_list(item)
      @item_list << generate_item_details(item)
    end

    def increment_total_cost(item)
      @total_cost += get_item_cost(item)
    end

    def increment_sales_tax(item)
      @total_tax += compute_item_tax(item)
    end

    def build_item
      { list: @item_list, total_cost: @total_cost, sales_tax: @total_tax }
    end

    def compute_item_tax(item)
      item[:quantity] * compute_tax(item)
    end

    def compute_tax(item)
      item_tax = 0
      basic_tax = basic_sales_tax(item[:price], item[:essential])
      import_duty = import_duty(item[:price], item[:imported])
      item_tax += (basic_tax + import_duty)
    end

    def basic_sales_tax(price, type)
      type ? 0 : @sales_tax.basic_sales_tax(price)
    end

    def import_duty(price, type)
      type ? @sales_tax.import_duty(price) : 0
    end

    def generate_item_details(item)
      item[:cost] = get_item_cost(item)
      item
    end

    def compute_item_cost(item, tax)
      (item[:quantity] * item[:price]) + tax
    end
  
    def get_item_cost(item)
      compute_item_cost(item, compute_item_tax(item)).round(2)
    end

end
