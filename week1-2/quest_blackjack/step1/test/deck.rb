require './card.rb'

class Deck < Card
    attr_reader :selected_type, :selected_number, :selected_score
    def draw
        #@cards = {"type" => {"numbers" => value数値},"type" => {"numbers" => value数値}...}の形で4種類あるのでまずtypeの部分のキーでランダムに取り出す。
        @selected_type = @cards.keys.sample

        #上でtypeキー選んだので文字列でキーとして入っているnumberの部分を抽選
        @selected_number = @cards[selected_type].keys.sample

        #2つのキーを抽選した変数できているのでその値を返す数値つまりスコアを変数に入れる。
        @selected_score = @cards[selected_type][selected_number]

        # 選択されたカードを削除する。
        @cards[@selected_type].delete(@selected_number)
        if @cards[@selected_type].empty?
            @cards.delete(@selected_type)
        end
    end
end