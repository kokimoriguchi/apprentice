#1シンボル
=begin
・シンボルとは何か
    →：appleのように指定することでシンボルを作成できます。シンボルはその文字列と一対一に対応するオブジェクトのことです。
    オブジェクトとは操作の対象になっているデータのことを指し、シンボルを指定することでその文字列と同意義のオブジェクトを作ることです。
・文字列と何が違うのか
    →文字列との違いはシンボルはruby内で整数として管理されており、中身としては整数として管理されます。二つの値が同じかどうか調べる場合文字列よりも高速に処理できます。
・シンボルがよく使われるのはどのような用途か
    →大量の同じシンボルを作成した場合には上記で記入したように整数で参照できるため文字列よりも早く処理ができる。
=end

#2両替
def convert_currency(amount, source_currency, target_currency, conversion_rates)
    #変換元の金額を変換する
    usa = amount / conversion_rates[source_currency]
    # 変換先の通貨に換算する
    converted_amount = usa * conversion_rates[target_currency]
    # 換算後の金額を返す
    p converted_amount
end

conversion_rates = {
    usd: 1.0,
    jpy: 110.0,
    eur: 0.8
}
convert_currency(100, :usd, :jpy, conversion_rates)

