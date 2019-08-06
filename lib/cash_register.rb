class CashRegister
    attr_accessor :total
    attr_reader :discount, :items
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        @last_transaction = [title, price, quantity]
        @total += (price * quantity)
        quantity.times do
            @items << title
        end
    end

    def apply_discount
        @total = @total * (1.0 - (@discount/100.0))
        if @discount == 0
            "There is no discount to apply."
        else
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def void_last_transaction
        @last_transaction[2].times do
            @items.pop
        end
        @total -= (@last_transaction[1]*@last_transaction[2])
    end

end

