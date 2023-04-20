require './player'

module JudegModule

    def burst?(score)
        score >= 22
    end

end

class Judge

    def initialize(player, dealer)
        @player = player
        @dealer = dealer
    end

    def game_judge
        puts "あなたの得点は#{@player.total_score}です。"
        puts "ディーラーの得点は#{@dealer.total_score}です。"
        if @player.total_score > @dealer.total_score
            puts "あなたの勝ちです！"
        else
            puts "ディーラーの勝ちです！"
        end
    end
end