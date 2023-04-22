require_relative './judge'

#ゲームをプレイする人物
class Player
    include JudegModule

    # Deckクラスのインスタンスを受け取る
    def initialize(deck, name)
        @name = name
        @deck = deck
        @current_score = 0
    end

    #初めの2枚ドロー
    def first_draw
        @deck.draw
        add_score
        puts "#{@name}の引いたカードは#{@deck.selected_type}の#{@deck.selected_number}です。"
        @deck.draw
        add_score
        puts "#{@name}の2枚目に引いたカードは#{@deck.selected_type}の#{@deck.selected_number}です。"
    end

    #追加ドロー（ヒット）する場合の処理
    def hit
        @deck.draw
        add_score
        puts "#{@name}の引いたカードは#{@deck.selected_type}の#{@deck.selected_number}です。"
        puts "#{@name}の現在の得点は#{@current_score}です"
    end

    #現在のスコア
    def total_score
        @current_score
    end

    #current_scoreにドローしたスコアをプラスする。かつ、プラスする際にAを含んでいれば21以内で最大値になる方（1or11）にするメソッド
    def add_score
        @current_score += @deck.selected_score
        if ['A'].include?(@deck.selected_number) && @current_score <= 11
            @current_score += 10
        end
    end

end