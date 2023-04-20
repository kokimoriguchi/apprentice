
require './judge'

#ゲームをプレイする人物
class Player
    include JudegModule

    # Deckクラスのインスタンスを受け取る
    def initialize(deck)
        @deck = deck
        @total_score = 0
    end

    #1枚目のドロー
    def first_draw
        @deck.draw
        @first_score = @deck.selected_score
        puts "あなたの引いたカードは#{@deck.selected_type}の#{@deck.selected_number}です。"
    end

    #2枚目のドロー
    def second_draw
        @deck.draw
        @second_score = @deck.selected_score
        puts "あなたの2枚目に引いたカードは#{@deck.selected_type}の#{@deck.selected_number}です。"
        current_score #2枚目引いた時点でcurrent_scoreに数字入っているのでここで返している。
    end

    #2枚の合計点数
    def current_score
        @current_score = @first_score + @second_score
    end

    #ドローするかどうかの判断
    def select_thing
        loop do
            puts "あなたの現在の得点は#{@current_score}です。カードを引きますか？（Y/N）"
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

    #追加ドロー（ヒット）する場合の処理
    def hit
        @deck.draw
        @current_score += @deck.selected_score
        puts "あなたの引いたカードは#{@deck.selected_type}の#{@deck.selected_number}です。"
        re_hit
    end

    #現在のスコア
    def total_score
        @current_score
    end

    #追加ドロー（ヒット）した後にスコアの評価し判断する。
    def re_hit
        return 'Burst' if burst?(total_score)

        select_thing
    end
end