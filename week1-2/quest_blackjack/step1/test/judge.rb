require './player'

class Judge

    def initialize(player, deck)
        @deck = deck
        @player = player
        #@dealer = dealer
    end


    #バースト確認メソッド
    def burst?
        puts "aaaaaaa"
        @player.total_score > 21
    end

    def game_over
        puts "あなたの負けです。"
    end

end