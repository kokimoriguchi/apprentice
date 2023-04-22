#ディーラーの処理
require 'debug'

class Dealer
    include JudegModule

    # Deckクラスのインスタンスを受け取る
    def initialize(deck)
        @deck = deck
        @total_score = 0
        @current_score = 0
    end

    #1枚目のドロー
    def first_draw
        @deck.draw
        add_score
        puts "ディーラーの引いたカードは#{@deck.selected_type}の#{@deck.selected_number}です。"
    end

    #2枚目のドロー
    def second_draw
        @deck.draw
        add_score
        #1度セカンドドロー変数に入れておいて開示のタイミングで変数取れるようにする。
        @second_draw_type = @deck.selected_type
        @second_draw_number = @deck.selected_number
        puts 'ディーラーの2枚目のカードはわかりません。'
    end

    #2枚の合計点数
    attr_reader :current_score

    #2枚目のカード公開し、合計点数出す。
    def show_second_draw
        puts "ディーラーの引いた2枚目のカードは#{@second_draw_type}の#{@second_draw_number}でした。"
        puts "ディーラーの現在の得点は#{@current_score}です。"
        add_hit
    end

    #現在のスコア
    def total_score
        @current_score
    end

    #17以下の場合。追加でドローするかどうかの判断
    def add_hit
        return unless @current_score < 17

        hit

        total_score
    end

    #追加ドロー（ヒット）する場合の処理
    def hit
        @deck.draw
        add_score
        puts "ディーラーの引いたカードは#{@deck.selected_type}の#{@deck.selected_number}です。"
        puts "ディーラーの現在の得点は#{@current_score}です。"
        re_hit
    end

    #追加ドロー（ヒット）した後にスコアの評価し判断する。
    def re_hit
        return if burst?(total_score)

        add_hit
    end

    #current_scoreにドローしたスコアをプラスする。かつ、プラスする際にAを含んでいれば21以内で最大値になる方（1or11）にするメソッド
    def add_score
        @current_score += @deck.selected_score
        if ['A'].include?(@deck.selected_number) && @current_score < 11
            @current_score += 10
        end
    end
end