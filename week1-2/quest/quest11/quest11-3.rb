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