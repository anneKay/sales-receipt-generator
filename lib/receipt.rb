
class Receipt

  def initialize(sales_details_list, total_cost, sales_tax)
    @sales_details_list = sales_details_list
    @total_cost = total_cost
    @sales_tax = sales_tax
  end


  def sales_list
    @sales_details_list.map { |sales_details| sales_list_format(sales_details) }
  end

  def print_receipt
    puts generate_receipt
  end

  def sales_list_format(sales_details)
    "#{sales_details[:quantity]} #{sales_details[:name]}: #{'%.2f' % sales_details[:cost]}"
  end
  
  private

  def generate_receipt
    list = sales_list

    if list.any?
      list << ("Sales Tax: #{'%.2f' % @sales_tax}" )
      list << ("Total: #{'%.2f' % @total_cost}")
    end

  end

end