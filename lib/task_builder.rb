class TaskBuilder
  def initialize(filename)
    @filename = filename
  end

  def print_receipt
    generate_sales_details
    receipt = Receipt.new(@item_list, @total_cost, @sales_tax)
    receipt.print_receipt
  end

  private

    def generate_sales_details

      sales = SalesCalculator.new(transformed_input)
      sales.set_sales_details
      @item_list = sales.item_list
      @total_cost = sales.total_cost
      @sales_tax = sales.sales_tax
    
    end

    def transformed_input
      input = FileReader.new(@filename)
      input.items
    end

end
