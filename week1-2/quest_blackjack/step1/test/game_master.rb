require './deck'
require './player'
require './dealer'
require './judge'

class GameMaster

    def initialize
        #52枚のカード作成してデッキ作る。ドローはデッキから行う。
        @card = Card.new
        @deck = Deck.new

        # Deckクラスのインスタンスを渡して
        @player = Player.new(@deck)
        @dealer = Dealer.new(@deck)

        # プレイヤーとディーラーのインスタンスを渡す。バーストとかの条件分岐はここでする。
        @judge = Judge.new(@player, @dealer)
    end

    def start
        puts '----------------------------------------------'
        puts 'ブラックジャックゲームを始めます。'

        #プレイヤーの最初の処理
        @player.first_draw
        @player.second_draw

        #ディーラーの最初の処理
        @dealer.first_draw
        @dealer.second_draw
    end

    def turn_one
        @player.select_thing
        @dealer.show_second_draw
        @dealer.add_hit
    end

end

game_master = GameMaster.new
game_master.start
game_master.turn_one
