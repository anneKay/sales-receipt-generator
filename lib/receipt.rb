
class Receipt
  attr_reader :details

  def initialize(details)
    @details = sales_details(details)
  end

  def generate_receipt
    list = sales_list
    if sales_list.any?
      list << ("Sales Taxes: #{'%.2f' % @sales_tax}" )
      list << ("Total: #{'%.2f' % @total_cost}")
    end
  end

  def print_receipt
    puts generate_receipt
    generate_receipt
  end

  private

    def sales_details(details)
      @sales_details_list = details[:list]
      @total_cost = details[:total_cost]
      @sales_tax = details[:sales_tax]
    end
  
    def sales_list
      @sales_details_list&.map { |sales_details| sales_list_format(sales_details) }
    end

    def sales_list_format(sales_details)
      "#{sales_details[:quantity]} #{sales_details[:name]}: #{'%.2f' % sales_details[:cost]}"
    end

end