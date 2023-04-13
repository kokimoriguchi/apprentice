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