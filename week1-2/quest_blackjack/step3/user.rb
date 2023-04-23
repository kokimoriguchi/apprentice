require_relative 'player'
require 'debug'
class User < Player
    def initialize(deck, name)
        super
    end

    #ドローするかどうかの判断
    def select_thing
        loop do
            puts "#{@name}の現在の得点は#{@current_score}です。カードを引きますか？（Y/N）"
            selected = gets.chomp.upcase
            case selected
            when 'Y'
                hit
                break
            when 'N'
                break
            else
                puts 'Y(yes)もしくはN(no)を選択してください。'
            end
        end
        #ゲームマスタークラスで条件分岐するためにトータルスコア返している
        total_score
    end

    #追加ドロー（ヒット）した後にスコアの評価し判断する。
    def re_hit
        return 'Burst' if burst?(total_score)
        select_thing
    end

end