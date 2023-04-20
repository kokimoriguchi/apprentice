require './deck'
require './player'
require './dealer'
require './judge'

class GameMaster

    include JudegModule

    def initialize
        #52枚のカード作成してデッキ作る。ドローはデッキから行う。
        @card = Card.new
        @deck = Deck.new

        # Deckクラスのインスタンスを渡して
        @player = Player.new(@deck)
        @dealer = Dealer.new(@deck)

        # プレイヤーとディーラーのインスタンスを渡す。バーストとかの条件分岐はここでする。
        @judge = Judge.new(@player, @dealer)

        start
        player_draw_turn
    end

    def start
        puts '----------------------------------------------'
        puts 'ブラックジャックを開始します。'

        #プレイヤーの最初の処理
        @player.first_draw
        @player.second_draw

        #ディーラーの最初の処理
        @dealer.first_draw
        @dealer.second_draw
    end

    def player_draw_turn
        #binding.break
        score = @player.select_thing
        if burst?(score)
            puts "あなたの現在の得点は#{score}です"
            puts "バーストしました。あなたの負けです。"
            end_turn
        else
            dealer_draw_turn
        end
    end

    def dealer_draw_turn
        score = @dealer.show_second_draw
        if burst?(score)
            puts "ディーラーの現在の得点は#{score}です。"
            puts "バーストしました。"
            puts "プレイヤーの勝ちです。"
            end_turn
        else
            judge_turn
        end
    end

    def judge_turn
        @judge.game_judge
        end_turn
    end

    def end_turn
        puts 'ブラックジャックゲームを終了します。'
        puts '----------------------------------------------'
    end

end

game_master = GameMaster.new