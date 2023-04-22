#ゲームの判定をするクラス

require './player'

#バーストの判定するモジュール
module JudegModule
    def burst?(score)
        score >= 22
    end
end

#ゲームの判定をするクラス
class Judge
    def initialize(user, dealer)
        @user = user
        @dealer = dealer
    end

    def game_judge
        puts "あなたの得点は#{@user.total_score}です。"
        puts "ディーラーの得点は#{@dealer.total_score}です。"
        if @user.total_score > @dealer.total_score
            puts 'あなたの勝ちです！'
        elsif @user.total_score == @dealer.total_score
            puts '引き分けです。'
        else
            puts 'ディーラーの勝ちです！'
        end
    end
end