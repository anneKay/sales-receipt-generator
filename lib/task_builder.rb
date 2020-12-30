class TaskBuilder
  def initialize(filename)
    @filename = filename
  end

  def print_receipt
    if transformed_input.nil?
      puts "please check that your file name is correct and it's in the input folder"
    elsif transformed_input.empty?
      puts "please check that you have added valid inputs in your test file"
    else
      receipt = Receipt.new(generate_sales_details)
      receipt.print_receipt

    end
  end

  private

    def generate_sales_details
      unless transformed_input.nil?
        sales = SalesCalculator.new(transformed_input)
        sales.sales_details
      end
    end

    def transformed_input
      input = FileReader.new(@filename)
      input.items
    end

end
