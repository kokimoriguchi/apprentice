require './card'

#52枚の中からランダムに1枚ドローするデッキクラス
class Deck < Card
    attr_reader :selected_type, :selected_number, :selected_score

    #おそらく文字列でキーとして入っている数字の部分を2回目引いてしまうことがありそれでエラーが出る。
    def draw
        if @cards.empty?
            puts 'カード切れ'
            raise
        else
            #@cards = {"type" => {"numbers" => value数値},"type" => {"numbers" => value数値}...}の形で4種類あるのでまずtypeの部分のキーでランダムに取り出す。
            @selected_type = @cards.keys.sample

            #上でtypeキー選んだので文字列でキーとして入っているnumberの部分を抽選
            @selected_number = @cards[selected_type].keys.sample

            #2つのキーを抽選した変数できているのでその値を返す数値つまりスコアを変数に入れる。
            @selected_score = @cards[selected_type][selected_number]

            # 選択されたカードを削除する。
            @cards[@selected_type].delete(@selected_number)

            #絵柄の中の数値が空であれば絵柄を削除する。
            @cards.delete(@selected_type) if @cards[@selected_type].empty?
        end
    end
end