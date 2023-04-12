class VendingMachine
    def initialize(name)
        @name = name
        @money = 0
    end

    def deposit_coin(money)
        if money == 100
            @money += money
        else
            "error"
        end
    end

    def press_button(item)
        case item
        when Item.cola
            @money >= Item.cola.price && @money -= Item.cola.price
            "cola"
        when Item.cider
            @money >= Item.cider.price && @money -= Item.cider.price
            "cider"
        else
            "error"
        end
    end

    private
    def press_manufacturer_name
        @name
    end

end

class Item
    attr_reader :item,:price

    def initialize(item, price)
        @item = item
        @price = price
    end

    def cola
        price = 150
    end
end

