#ディーラーの処理
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
        @current_score += @deck.selected_score
        puts "ディーラーの引いたカードは#{@deck.selected_type}の#{@deck.selected_number}です。"
    end

    #2枚目のドロー
    def second_draw
        @deck.draw
        @second_draw_score = @deck.selected_score
        @second_draw_type = @deck.selected_type
        @second_draw_number = @deck.selected_number
        puts 'ディーラーの2枚目のカードはわかりません。'
        current_score #2枚目引いた時点でcurrent_scoreに数字入っているのでここで返している。
    end

    #2枚の合計点数
    attr_reader :current_score

    #2枚目のカード公開し、合計点数出す。
    def show_second_draw
        @current_score += @second_draw_score
        #first_scoreとsecond_scoreの値を渡しておかないとcurrent_scoreの値がでない
        puts "ディーラーの引いた2枚目のカードは#{@second_draw_type}の#{@second_draw_number}でした。"
        puts "ディーラーの現在の点数は#{@current_score}です。"
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
        @current_score += @deck.selected_score
        puts "ディーラーの引いたカードは#{@deck.selected_type}の#{@deck.selected_number}です。"
        re_hit
    end

    #追加ドロー（ヒット）した後にスコアの評価し判断する。
    def re_hit
        return if burst?(total_score)

        add_hit
    end
end