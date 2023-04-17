#require 'minitest/autorun'
#require_relative '../lib/blackjack_step1'
require 'debug'

def title
	puts "----------------------------------------"
	puts "ブラックジャックを開始します。"
	puts "----------------------------------------"
end

#class Player
#end


#class Dealer
#end


class Card
	attr_reader :cards
	def initialize
		#インスタンス生成時に初期値として入れられるのがインスタンス変数。今回はnewした時に引数取らないのでメソッドのとこは引数なし。その代わりそれぞれ配列など入れてる。
		@types = [:club, :diamond, :heart, :spade]
		@numbers = ["A", *2..10, "J", "Q", "K"]
		@cards = create_card(@types, @numbers)
	end

	def create_card(types, numbers)
		#ローカル変数cardsにまず空のハッシュを定義し、このメソッドでインスタンス変数を引数にtypesとnumbers受けてる。
		#その後typesをeachで元の配列をブロックに入れ、さらにそこからmapでnumberを新しい配列として受け取っている。typeがキーでnumbersが値のハッシュがcards。
		cards = {}
		types.each do |type|
		cards[type] = numbers.map { |number| "#{number}" }
		end
		#binding.break
		cards
	end

	def selected_card
		#binding.break
		# キーと値を取得
		key, value = @cards.to_a.sample

		# カードを選ぶ
		card = value.sample

		# 結果を返す
		return { key: key, card: card }
	end

end

#class Deck
#end

#class HandCard
#end

#class Rule
#end

#class Judge
#end

title
card = Card.new
puts card.selected_card




=begin
class Card
  cards = [:club, :diamond, :heart, :spade].product(["A", *2..10, "J", "Q", "K"]).map{|s| s.join}

  selected_card = cards.sample
  puts "Selected card: #{selected_card}"
end
=end

#def initialize(arg = {})
#human = {name: "simble", age: 27}
#puts human[:name]
#ハッシュの引数で名前として扱いたい時、名前::値 チェリー本5.4.3参照
#ハッシュは基本数字として認識される。
#arg.feach(name: "simble" )