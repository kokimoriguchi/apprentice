require './deck'
require './player'
require './dealer'
require './judge'

#ゲームの全体統括
class GameMaster
    include JudegModule

    def initialize
        #52枚のカード作成してデッキ作る。ドローはデッキから行う。
        @card = Card.new
        @deck = Deck.new

        # Deckクラスのインスタンスを渡して算用できるようにしている。
        @player = Player.new(@deck) #デッキからみたいなイメージ
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

    #プレイヤーのヒットするかどうかの判断とその繰り返しメソッド呼び出す。バーストしたら終了に分岐。
    def player_draw_turn
        score = @player.select_thing
        if burst?(score)
            puts 'バーストしました。あなたの負けです。'
            end_turn
        else
            dealer_draw_turn
        end
    end

    #プレイヤーのヒットが終わったら呼び出される。バーストしなければ得点の比較に入るジャッジターンを呼び出す。
    def dealer_draw_turn
        @dealer.show_second_draw
        score = @dealer.total_score
        if burst?(score)
            puts 'バーストしました。'
            puts 'プレイヤーの勝ちです。'
            end_turn
        else
            judge_turn
        end
    end

    #ジャッジクラスの勝敗決めを呼び出す。
    def judge_turn
        @judge.game_judge
        end_turn
    end

    def end_turn
        puts 'ブラックジャックゲームを終了します。'
        puts '----------------------------------------------'
    end
end

GameMaster.new