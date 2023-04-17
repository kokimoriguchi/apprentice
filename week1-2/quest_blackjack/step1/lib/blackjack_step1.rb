require 'debug'


class Player
end

class Dealer
end

class Card
    def initialize
        #インスタンス生成時に初期値として入れられるのがインスタンス変数。今回はnewした時に引数取らないのでメソッドのとこは引数なし。その代わりそれぞれ配列など入れてる。
        @types = [:club, :diamond, :heart, :spade]
        @numbers = ["A", *2..10, "J", "Q", "K"]
        @cards = create_card(@types, @numbers)
    end

    def create_card(types, numbers)
        #ローカル変数cardsにまず空のハッシュを定義し、このメソッドでインスタンス変数を引数にtypesとnumbers受けてる。
        #その後typesをeachで元の配列をブロックに入れ、さらにそこからmapでnumberを新しい配列として受け取っている。
        cards = {}
        types.each do |type|
          cards[type] = numbers.map { |number| "#{number}" }
        end
        #ここでcards返しているからインスタンス変数の＠cardsに全ての場合のトランプが入っている。
        cards
    end
end

class Deck < Card
end

class HandCard
end

class Rule
end

class Judge

end