require_relative './lib/parser'
require_relative './lib/receipt'
require_relative './lib/file_reader'
require_relative './lib/sales_tax'
require_relative './lib/sales_calculator'
require_relative './lib/item'


filename = ARGV.first
task = FileReader.new(filename)
sales = SalesCalculator.new(task.items)
sales.set_sales_details
receipt = Receipt.new(sales.item_list, sales.total_cost, sales.sales_tax)
receipt.print_receipt
