#1クラスの定義
=begin
class VendingMachine
    def press_button
        'cider'
    end
end
vending_machine = VendingMachine.new
puts vending_machine.press_button


#2initializeメソッド
class VendingMachine
    def initialize(name)
        @name = name
    end

    def press_button
        'cider'
    end

    def press_manufacturer_name
        @name
    end
end
vending_machine = VendingMachine.new('サントリー')
puts vending_machine.press_manufacturer_name

#3メソッドの可視性
class VendingMachine
    def initialize(name)
        @name = name
        @price = 0 #priceの初期値を0にしている
    end

    def deposit_coin(price)
        if price == 100 #100円以外受け付けないのでPriceの引数が100であれば加算していく。
            @price += price
        else
            "error"
        end
    end

    def press_button
        if @price >= 100　＃pressbuttonメソッド実行時に条件分岐でpriceが100以上であればpriceを-100しサイダーを返す。
            @price -= 100
            'cider'
        else
            'error'
        end
    end

    private
    def press_manufacturer_name
        @name
    end

end
vending_machine = VendingMachine.new('サントリー')
puts vending_machine.press_button

vending_machine.deposit_coin(150)
puts vending_machine.press_button

vending_machine.deposit_coin(100)
puts vending_machine.press_button

puts vending_machine.press_manufacturer_name

class VendingMachine
    def initialize(name)
        @name = name
        @price = 0
    end

    def deposit_coin(price)
        if price == 100
            @price += price #引数が100の場合＠priceのインスタンス変数にprice（100）をたす。
        else
            "error"
        end
    end

    def press_button(item)
        if item.item == 'cola' && @price >= 150
            @price -= 150
            "cola、残り#{@price}円です"
        elsif item.item == 'cider' && @price >= 100
            @price -= 100
            "cider、残り#{@price}円です"
        else
            'お金が足りません'
        end
    end

    private
    def press_manufacturer_name
        @name
    end

end

class Item
    attr_reader :item

    def initialize(item)
        @item = item
    end

end

cola = Item.new('cola')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)
=end

class VendingMachine
    def initialize(name)
        @name = name
        @money = 0
        @cup = 0
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
        when PetDrink.cola
            @money >= PetDrink.cola.price && @money -= PetDrink.cola.price
            "cola"
        when PetDrink.cider
            @money >= PetDrink.cider.price && @money -= PetDrink.cider.price
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

end

class PetDrink < Item
    items = []
    items <<

end


cola = Item.new('cola')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cider)