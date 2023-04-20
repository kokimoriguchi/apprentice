require 'debug'

class Dealer
    include JudegModule
    attr_reader :total_score

    # Deckクラスのインスタンスを受け取る
    def initialize(deck)
        @deck = deck
        @total_score = 0
        @current_score = 0
    end

    #1枚目のドロー
    def first_draw
        @deck.draw
        @first_score = @deck.selected_score
        puts "ディーラーの引いたカードは#{ @deck.selected_type }の#{ @deck.selected_number }です。"
    end

    #2枚目のドロー
    def second_draw
        @deck.draw
        @second_score = @deck.selected_score
        puts "ディーラーの2枚目のカードはわかりません。"
        current_score #2枚目引いた時点でcurrent_scoreに数字入っているのでここで返している。
    end

    #2枚の合計点数
    def current_score
        @current_score = @first_score + @second_score
    end

    #2枚目のカード公開し、合計点数出す。
    def show_second_draw
        #first_scoreとsecond_scoreの値を渡しておかないとcurrent_scoreの値がでない
        @first_score
        @second_score
        puts "ディーラーの引いた2枚目のカードは#{ @deck.selected_type }の#{ @deck.selected_number }でした。"
        puts "ディーラーの現在の点数は#{@current_score}です。"
        total_score
        add_hit
    end

    #現在のスコア
    def total_score
        @current_score
    end

    #17以下の場合。追加でドローするかどうかの判断
    def add_hit
        if @current_score < 17
            hit
        else
            return
        end
        total_score
    end

    #追加ドロー（ヒット）する場合の処理
    def hit
        @deck.draw
        @current_score += @deck.selected_score
        puts "ディーラーの引いたカードは#{ @deck.selected_type }の#{ @deck.selected_number }です。"
        puts "ディーラーの現在の点数は#{@current_score}です。"
        re_hit
    end

    #追加ドロー（ヒット）した後にスコアの評価し判断する。
    def re_hit
        if burst?(total_score)
            return
        else
            add_hit
        end
        total_score
    end

end
