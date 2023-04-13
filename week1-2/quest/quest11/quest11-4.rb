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