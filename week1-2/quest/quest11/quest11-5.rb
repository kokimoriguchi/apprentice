#5継承
class VendingMachine
    def initialize(name)
        @name = name
        @money = 0
        @count = 0
    end

    def deposit_coin(money)
        if money == 100
            @money += money
        else
            "error"
        end
    end

    def add_cup(count)
        if count <= 100
            @count += count
        else
            "容量がいっぱいです。"
        end
    end

    def press_button(item)
        case item.select_drink
        when "cider"
            if item.drink_price <= @money
                @money -= item.drink_price
                "cider"
            else
                "お金が足りません。"
            end
        when "cola"
            if item.drink_price <= @money
                @money -= item.drink_price
                "cola"
            else
                "お金が足りません。"
            end
        when "hot"
            if item.drink_price <= @money && @count > 0
                @money -= item.drink_price
                @count -= 1
                "hot"
            elsif @count == 0
                "カップがありません。"
            else
                "お金が足りません。"
            end
        when "ice"
            if item.drink_price <= @money && @count > 0
                @money -= item.drink_price
                @count -= 1
                "ice"
            elsif @count == 0
                "カップがありません。"
            else
                "お金が足りません"
            end
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
    attr_reader :select_drink

    def initialize(drink_name)
        @select_drink = drink_name
    end

end

class PetDrink < Item
    @@DRINK = {"cola" => 150, "cider" => 100} ##@@のクラス変数にすることでスーパークラス、サブクラスともに参照可能になる！

    def initialize(drink_name)
        super #Itemクラスを継承しているので@select_drink = drink_nameをsuperだけで表せる。
    end

    def drink_price
        @@DRINK[@select_drink]
    end

end

class CoffeDrink < Item
    @@DRINK = {"hot" => 100, "ice" => 100}

    def initialize(drink_name)
        super
    end

    def drink_price
        @@DRINK[@select_drink]
    end
end

#サンプルサンプル呼び出し
hot_cup_coffee = CoffeDrink.new('hot');
cider = PetDrink.new('cider')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cider)

puts vending_machine.press_button(hot_cup_coffee)
vending_machine.add_cup(1)
puts vending_machine.press_button(hot_cup_coffee)