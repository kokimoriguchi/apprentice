#require 'minitest/autorun'
#require_relative '../lib/blackjack_step1'
require 'debug'

class GameMaster
	#最初の処理
	def title
		puts "-------------------------"
		puts "ブラックジャックを開始します。"
		#52枚のカード生成
		card = Card.new

		#プレイヤーのドロー処理
		player_draw = Draw.new
		player_draw.draw_card
		player = Player.new(player_draw)
		player.first_hand_card(player_draw)

		#プレイヤーのドロー処理
		player_draw = Draw.new
		player_draw.draw_card
		player = Player.new(player_draw)
		player.second_hand_card(player_draw)
		player.calcurate

		#ディーラーのドロー処理
		dealer_draw = Draw.new
		dealer_draw.draw_card
		dealer = Dealer.new(dealer_draw)
		dealer.first_dealer_card(dealer_draw)

		#ディーラーのドロー処理
		dealer_draw = Draw.new
		dealer_draw.draw_card
		dealer = Dealer.new(dealer_draw)
		dealer.second_dealer_card(dealer_draw)
		dealer.calcurate
	end

	def finish
		puts "ブラックジャックを終了します。"
		puts "-------------------------"
	end
end

class Player

	def initialize(player_draw)
		@hand_type = player_draw.selected_type
		@hand_int = player_draw.selected_int
		@hand_number = player_draw.selected_number
	end

	#1枚目のドロー処理の実行
	def first_hand_card(player_draw)
		@first_hand_card = @hand_number
		puts "あなたの引いたカードは#{@hand_type}で、数字は#{@hand_int}です"
	end

	def second_hand_card(player_draw)
		#binding.break
		@second_hand_card = @hand_number
		puts "あなたの引いた2枚目のカードは#{@hand_type}で、数字は#{@hand_int}です"
	end

	def calcurate
		pp @first_hand_card
		pp @second_hand_card
	end
end


class Dealer
	attr_reader :first_dealer_card, :second_dealer_card
	def initialize(dealer_draw)
		@hand_type = dealer_draw.selected_type
		@hand_number = dealer_draw.selected_number
		@hand_int = dealer_draw.selected_int

	end

	def first_dealer_card(dealer_draw)
		@first_dealer_card = @hand_number
		puts "ディーラーの引いたカードは#{@hand_type}で、数字は#{@hand_int}です"
	end

	def second_dealer_card(dealer_draw)
		@second_dealer_card = @hand_number
		puts "ディーラーの引いた2枚目のカードはわかりません。#{@hand_number}"
	end

	def calcurate
		pp @first_dealer_card
		pp @second_dealer_card
	end
end

class Card
	attr_reader :cards
	def initialize
		#インスタンス生成時に初期値として入れられるのがインスタンス変数。今回はnewした時に引数取らないのでメソッドのとこは引数なし。その代わりそれぞれ配列など入れてる。
		@types = [:club, :diamond, :heart, :spade]
		@numbers = { "A" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "J" => 11, "Q" => 12, "K" => 13 }
		@cards = create_card(@types, @numbers)
	end

	def create_card(types, numbers)
		#ローカル変数cardsにまず空のハッシュを定義し、このメソッドでインスタンス変数を引数にtypesとnumbers受けてる。
		#その後typesをeachで元の配列をブロックに入れtypeがキーでnumbersが値のハッシュがcards。 %w[]
		cards = {}
		types.each do |type|
		cards[type] = numbers
		end
		cards
	end

end

#カードを引くときの処理。
class Draw < Card
	attr_reader :selected_type, :selected_number, :selected_int

	def draw_card
		# [:diamond, {"A"=>1, "2"=>2..}]のようになっているのが4つあるのでその中から1つ選ぶ
		selected_card = @cards.to_a.sample

		# 絵柄とそのハッシュを取得
		#[:diamond, {"A"=>1, "2"=>2..}]みたいに配列の中に数字のハッシュがある感じなので0がtypeで1が数値になる
		@selected_type = selected_card[0]

		# 数字を取得
		# キーに対応する値の中からランダムに1つ取得する配列ないは[:diamond, {"A"=>1, "2"=>2..}]で実質2個しかないので1が数値になるのでそれをランダムに抜く
		@selected_number = selected_card[1].values.sample

		#上段と同じ容量で数字のキーここではKとかが該当
		@selected_int = selected_card[1].keys.sample
	end

end

#class HandCard
#end

#class Rule
#end

class Judge
end

game = GameMaster.new
game.title



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