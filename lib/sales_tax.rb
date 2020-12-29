class SalesTax

  def initialize(price)
    @price = price
    @ROUND_FACTOR = 0.05.freeze
    @BASIC_SALES_RATE = 0.1.freeze
    @IMPORT_DUTY = 0.05.freeze
  end

  def basic_sales_tax
    ((@BASIC_SALES_RATE * @price) * 1 / @ROUND_FACTOR).ceil.to_f / 20
  end

  def import_duty
    ((@IMPORT_DUTY * @price) * 1 / @ROUND_FACTOR).ceil.to_f / 20
  end

end
