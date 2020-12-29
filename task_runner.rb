require_relative './lib/parser'
require_relative './lib/receipt'
require_relative './lib/file_reader'
require_relative './lib/sales_tax'
require_relative './lib/sales_calculator'
require_relative './lib/item'
require_relative './lib/task_builder'

filename = ARGV.first

task = TaskBuilder.new(filename)
task.print_receipt
