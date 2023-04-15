#5継承
class VendingMachine
    def initialize(name)
        @name = name
        @money = 0
        @count = 0
    end

    #投入金額足すのと100円かどうかの判断
    def deposit_coin(money)
        if money == 100
            @money += money
        else
            "error"
        end
    end

    #カップ足すのと100以下かどうかの判断
    def add_cup(count)
        if count <= 100
            @count += count
        else
            "容量がいっぱいです。"
        end
    end

    #hotかiceかどうかの判断
    def temperature(item)
        item.select_drink == "hot" || item.select_drink == "ice"
    end

    #金額が商品の値段以上あるのか確認するメソッド
    def calcurate(item)
        @money >= item.drink_price
        item.select_drink
    end

    #決済完了させ商品を出す。
    def pay(item)
        @money -= item.drink_price
        item.select_drink
    end

    #商品選んで名前返す
    def press_button(item)
        if calcurate(item)
            if temperature(item)
                if @count > 0
                    @count -= 1
                    pay(item)
                else
                    "error"
                end
            else
                pay(item)
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
    @@drink = {"cola" => 150, "cider" => 100} ##@@のクラス変数にすることでスーパークラス、サブクラスともに参照可能になる！

    def initialize(drink_name)
        super #Itemクラスを継承しているので@select_drink = drink_nameをsuperだけで表せる。
    end

    def drink_price
        @@drink[@select_drink]
    end

end

class CoffeDrink < Item
    @@drink = {"hot" => 100, "ice" => 100}

    def initialize(drink_name)
        super
    end

    def drink_price
        @@drink[@select_drink]
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