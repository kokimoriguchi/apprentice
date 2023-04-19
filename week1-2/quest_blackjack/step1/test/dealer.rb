class Dealer

    attr_reader :total_score

    # Deckクラスのインスタンスを受け取る
    def initialize(deck)
        @deck = deck
        @total_score = 0
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

    def show_second_draw
        puts "ディーラーの引いた2枚目のカードは#{ @deck.selected_type }の#{ @deck.selected_number }でした。"
        puts "ディーラーの合計点数は#{@current_score}です。"
    end

    #現在のスコア
    def total_score
        @total_score = @current_score
    end

    def add_hit
        if @total_score < 17
            hit
        end
    end

    #追加ドロー（ヒット）する場合の処理
    def hit
        @deck.draw
        @current_score += @deck.selected_score
        puts "ディーラーの引いたカードは#{ @deck.selected_type }の#{ @deck.selected_number }です。"
    end


end
