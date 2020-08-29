require 'pry'
class CashRegister

    attr_accessor :discount, :total

    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @@items = []
        @@last_total = 0
       
    end

    def add_item (item, price, quantity = 1)
        quantity.times {self.items << item}
        if quantity > 0
            last_total = (price * quantity)
            @@last_total = last_total
            self.total += last_total
        end
    end

    def apply_discount
        if discount > 0
            self.total *= (1 - (discount * 0.01))
            return "After the discount, the total comes to $#{total}."
        else 
            return "There is no discount to apply."
        end
    end

    def items
        @@items
    end

    def void_last_transaction
        self.total -= @@last_total
    end
end
