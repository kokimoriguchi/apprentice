#7オブジェクト指向を使うことができる.
#question
=begin
・自動販売機の機能を持つプログラム
    ciderは100円、colaは150円、coffeeはHOTとICEに分かれる。どちらも100円、スナック菓子でcandyもある。100円。
    コインが投入され、貯まっていく機能を持つ。貯まっている金額より大きい値段のものは買えない。
    メーカー名も返す
    coffeはカップで出される。
    自動販売機には100個までカップが入る。カップがないとcoffeは買えない。1つ買うと1つ減る。
=end

require 'debug'

class Machine
    def initialize(machine_name)
        @machine_name = machine_name
        @money = 0
        @cup = 0
    end

    def vender_machine_name
        @machine_name
    end

    def count_money(money)
        if money == 100
            @money += money
            puts "ok"
        end
    end

    def count_cup(cup)
        if cup < 100
            @cup += cup
            puts "ok"
        end
    end
end

class Products
    attr_reader :product_name

    def initialize(product_name) #productsクラスをnewした時に引数product_nameを初期化。
        @product_name = product_name #初期化したproduct_nameをインスタンス変数の@product_nameに格納
    end

end

class PetDrink < Products
    @@each_product = {"cider" => 100, "cola" => 150}

    def initialize(product_name)
        super
    end

    def product_price
        @@each_product[@product_name] #@@each_productはクラス変数で別クラスでも参照可能になる。そして[@product_name]は格納されている引数を配列として入れ直している。
    end
end

class CupCoffe < Products
    @@each_product = {"hot_coffe" => 100, "ice_coffe" => 100}
    def initialize(product_name)
        super
    end
end

class Snak < Products
    @@each_product = {"candy" => 100}
    def initialize(product_name)
        super
    end
end


#sample output
machine = Machine.new("サントリー")
puts machine.vender_machine_name
machine.count_money(100)
machine.count_cup(19)
purchase = Products.new("cider")
puts purchase.product_name
cider = PetDrink.new("cola")
puts cider.product_price