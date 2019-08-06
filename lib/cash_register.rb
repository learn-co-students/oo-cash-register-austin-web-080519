class CashRegister
  attr_accessor :total
  attr_reader :discount
  def initialize(discount = 0)
    @total = 0.0
    @discount = discount
    @items = []
    @last_quantity = "0"
    @last_price = "0"
  end
  def add_item(item, price, quantity = 1)
    @last_quantity = quantity
    @last_price = @last_quantity * price
    for i in (0...quantity)
      @items << {item => price}
      @total += price
    end
  end
  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      @total -= ((discount.to_f/100) * @total)
      if @total == @total.floor
        return "After the discount, the total comes to $#{@total.to_i}."
      else
        return "After the discount, the total comes to $#{@total}."
      end
    end
  end
  def items
    itemkeys = []
    @items.each do |itemhash|
        itemkeys << itemhash.keys
    end
    itemkeys.flatten!
  end
  def void_last_transaction
    @items.pop(@last_quantity)
    @total -= @last_price
  end
end
