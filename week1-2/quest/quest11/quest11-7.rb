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

    #機械のメーカー名返す機能
    def vender_machine_name
        @machine_name
    end

    #お金が100円かどうか判断しプラスしていく機能
    def count_money(money)
        return unless money == 100

        @money += money
    end

    #カップの個数を100以下かどうか判断してからプラスしていく機能
    def count_cup(cup)
        return unless cup < 100

        @cup += cup
    end

    def temperature(item)
        return unless item.product_name == 'hot_coffee' || item.product_name == 'ice_coffee'
        item.product_name
    end

    #投入されているお金が選んだ商品よりも多いかどうか判断しお金があればその分マイナスする
    def pay(item)
        @money -= item.product_price
        puts item.product_name
    end

    #PetDrinkをnewした時のciderオブジェクトを引数として受け取り(ここではitemとしている)オブジェクト.メソッドで値段を出している。
    def calcurate(item)
        @money >= item.product_price
    end

    #PetDrinkをnewした時のciderオブジェクトを引数として受け取り(ここではitemとしている)オブジェクト.メソッドで
    def comp_pay(item)
        #returnはこの条件当てはまればメソッドを抜ける。当てはまらなければ続きを実行する。breakは1個処理戻るくらいらしい
        #unlessなのでcalcurate(item)が偽の場合処理を抜ける。if文を1つ削れる。
        return unless calcurate(item)

        if temperature(item)
            if @cup > 1
                @cup -= 1
                pay(item)
            else
                puts 'cupが足りません'
            end
        else
            pay(item)
        end
    end
end

#商品のトップクラス
class Products
    attr_reader :product_name

    #productsクラスをnewした時に引数product_nameを初期化。初期化したproduct_nameをインスタンス変数の@product_nameに格納
    def initialize(product_name)
        @product_name = product_name
    end
end

#商品クラスの子クラスでペットボトル系の飲み物クラス
class PetDrink < Products
    @@each_product = { 'cider' => 100, 'cola' => 150 }

    #@@each_productはクラス変数で別クラスでも参照可能になる。そして[@product_name]は格納されている引数を配列として入れ直している。
    def product_price
        @@each_product[@product_name]
    end
end

#商品クラスの子クラスでカップに入ったコーヒークラス
class CupCoffe < Products
    @@each_product = { 'hot_coffee' => 100, 'ice_coffee' => 100 }

    #@@each_productはクラス変数で別クラスでも参照可能になる。そして[@product_name]は格納されている引数を配列として入れ直している。
    def product_price
        @@each_product[@product_name]
    end
end

#商品クラスの子クラスでお菓子のクラス
class Snak < Products
    @@each_product = { 'candy' => 100 }

    #@@each_productはクラス変数で別クラスでも参照可能になる。そして[@product_name]は格納されている引数を配列として入れ直している。
    def product_price
        @@each_product[@product_name]
    end
end

#sample output
cider = PetDrink.new('cider')
machine = Machine.new('santori')
coffe = CupCoffe.new('hot_coffee')
machine.count_money(100)
machine.pay(cider)
machine.count_cup(2)
machine.count_money(100)
machine.count_money(100)
machine.count_money(100)
machine.count_money(100)
machine.comp_pay(cider)
machine.comp_pay(coffe)
machine.comp_pay(cider)
machine.comp_pay(coffe)
