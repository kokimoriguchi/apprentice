class Card
	attr_reader :cards
	def initialize
		#インスタンス生成時に初期値として入れられるのがインスタンス変数。今回はnewした時に引数取らないのでメソッドのとこは引数なし。その代わりそれぞれ配列など入れてる。
		@types = ["club", "diamond", "heart", "spade"]
		@numbers = ["A", *(2..10).to_a.map(&:to_s), "J", "Q", "K"]
		@cards = create_card(@types, @numbers)
	end

    #52枚のカードの定義
    def create_card(types, numbers)
		cards = {}
		types.each do |type|
			cards[type] = {}
			numbers.each do |number|
				card_value = number.to_i # 数字の場合はそのまま値を使う
				card_value = 10 if ["J", "Q", "K"].include?(number) # card_valueにJ,Q,Kどれか含まれていたらJ,Q,Kは10の値を持つ
                card_value = 1 if ["A"].include?(number) #Aは1の値を持つ
				cards[type][number] = card_value
			end
		end
		cards
	end
end
