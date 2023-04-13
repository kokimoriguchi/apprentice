#6ポリモーフィズム
class VendingMachine
    def initialize(machine_name)
        @machine_name = machine_name
        @money = 0
        @count = 0
    end

    #お金を数える処理
    def deposit_coin(money)
        if money == 100
            @money += money
        else
            "error"
        end
    end

    #cupの個数を数える処理
    def add_cup(count)
        if count <= 100
            @count += count
        else
            "容量がいっぱいです。"
        end
    end

    #金額が商品の値段以上あるのか確認するメソッド
    def calcurate(item)
        @money >= item.drink_price
    end

    #決済完了させ商品を出す。
    def pay(item)
        @money -= item.drink_price
        item.select_drink
    end

    #商品選んで名前返す
    def press_button(item)
        if calcurate(item)
            if @count > 0
                @count -= 1
                pay(item)
            end
        else
            pay(item)
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
    @@DRINK = {"cola" => 150, "cider" => 100} ##@@のクラス変数にすることでスーパークラス、サブクラスともに参照可能

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

class Sweet < Item
    @@DRINK = {"poteto_chips" => 150}

    def initialize(drink_name)
        super
    end

    def drink_price
        @@DRINK[@select_drink]
    end
end

hot_cup_coffee = CoffeDrink.new('hot');
cider = PetDrink.new('cider')
snack = Sweet.new('poteto_chips')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cider)

puts vending_machine.press_button(hot_cup_coffee)
vending_machine.add_cup(1)
puts vending_machine.press_button(hot_cup_coffee)

puts vending_machine.press_button(snack)
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(snack)