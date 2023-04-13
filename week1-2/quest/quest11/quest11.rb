#1クラスの定義
=begin
class VendingMachine
    def press_button
        'cider'
    end
end

#サンプル呼び出し
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

#サンプル呼び出し
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
        if @price >= 100 #pressbuttonメソッド実行時に条件分岐でpriceが100以上であればpriceを-100しサイダーを返す。
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

#サンプル呼び出し
vending_machine = VendingMachine.new('サントリー')
puts vending_machine.press_button

vending_machine.deposit_coin(150)
puts vending_machine.press_button

vending_machine.deposit_coin(100)
puts vending_machine.press_button

puts vending_machine.press_manufacturer_name


#4単一責任の原則
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
        if item.drink_price <= @money #引数itemはサンプル呼び出しの部分でItemクラスオブジェクトがcolaとして入っている。
            @money -=item.drink_price #itemは上記の通りクラスオブジェクト入っているので.drink_priceなどで参照できる。
            item.select_drink
        else
            "お金が足りません"
        end
    end

    private
    def press_manufacturer_name
        @name
    end

end

class Item
    DRINK = {"cola" => 150, "cider" => 100} #定数の場合は基本的に大文字で書く。
    attr_reader :select_drink #インスタンス変数@select_drinkにアクセスするためのgetterメソッドを作成するための記法。attr_readerを使用してselect_drinkというpublicなメソッドを作成。

    def initialize(drink_name) #アイテムクラスをnewで作った時に渡される引数がdrink＿nameとして@select_drinkに格納
        @select_drink = drink_name #@select_drink自体はアクセス可能ですが、外部から直接参照することはできない。
    end

    def drink_price
        DRINK[@select_drink] #initializeの部分で@select_drinkに名前が格納されているので、#=>DRINK["cola"] => 150という評価になる。
    end
end

#サンプル呼び出し
cola = Item.new('cola') #cola = @select_drink('cola')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)#Itemクラスのオブジェクトを引数にしている
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)


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
=end

#6ポリモーフィズム
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
        when "poteto_chips"
            if item.drink_price <= @money
                @money -= item.drink_price
                "poteto_chips"
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