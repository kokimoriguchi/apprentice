#1ハッシュ
=begin
・ハッシュと配列は何が違うのか
    →ハッシュと配列は複数のデータをまとめて格納できる一つの箱のような物です。この箱の中身を要素（データ）と言います。
    上記二つの違いとしては、箱から要素を取り出す際などの扱い方が異なります。
    ハッシュは要素一つ一つにキーと呼ばれる個人IDようなものを設定できます。対して、配列は左から順に0、1、２…という風に要素に番号（インデックス）がついています。
    この違いから、箱から要素を取り出す際にハッシュの場合はキーを使用、配列の場合はインデックスを元に要素を取り出します。

・ハッシュと配列はそれぞれどのような用途に向いているのか
    →ハッシュは名前付きの要素を取り出す際に、配列は複数の要素を順序付けして取り出す場合に向いています。
=end

#2首都
def print_capitals(capitals)
    capitals.each do |country, capital| #||このブロック内でkey, valueの形でハッシュをeachで取り出している。
      puts "#{country}の首都は#{capital}です"
    end
end
print_capitals({ '日本' => '東京', 'アメリカ' => 'ワシントンD.C.' })
