#ディーラーの処理
require 'debug'

class Dealer < Player
    # include JudegModule
    attr_reader :current_score

    # Deckクラスのインスタンスを受け取る
    def initialize(deck, name)
        super
    end

    def first_draw
        @deck.draw
        add_score
        puts "#{@name}の引いたカードは#{@deck.selected_type}の#{@deck.selected_number}です。"
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

    #2枚目のカード公開し、合計点数出す。
    def show_second_draw
        puts "ディーラーの引いた2枚目のカードは#{@second_draw_type}の#{@second_draw_number}でした。"
        puts "ディーラーの現在の得点は#{@current_score}です。"
        add_hit
    end

    #17以下の場合。追加でドローするかどうかの判断
    def add_hit
        return unless @current_total_score < 17

        hit

        total_score
    end
end