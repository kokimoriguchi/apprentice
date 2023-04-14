#1例外
=begin
　・例外とは何か
　　→例外とはプログラミングの実行途中に何かしらのエラーによりその時点でコードが終了してしまうのを防ぐためのものです。
　・何の為にあるのか
　　→例えば入力された文字や数字が予想されていたものと違うなどのエラーの際に終了させずに、何が原因でエラーになったのかを表示することなどができる。
=end

#2電卓
def calculate(num1, num2, operator)
  # クラスを完成させてください
  if num1.is_a?(Integer) && num2.is_a?(Integer)
    case operator
    when '+'
      num1 + num2
    when '-'
      num1 - num2
    when '*'
      num1 * num2
    when '/'
      num1 / num2
    else
      raise ArgumentError.new("演算子には  +、-、*、/ のいずれかを使用してください") #newの引数はエラーメッセージになる。
    end
  else
    raise StandardError.new("num1、 num2 には整数を入力してください")
  end
end

puts "1番目の整数を入力してください:"
num1 = gets.chomp.to_i #to_iは整数に直すが整数以外を0で返す。

puts "2番目の整数を入力してください:"
num2 = gets.chomp.to_i

puts "演算子(+, -, *, /)を入力してください:"
operator = gets.chomp

begin
  result = calculate(num1, num2, operator)
  puts result
rescue ArgumentError => e #例外オブジェクトを格納する変数（exceptionの略）
  puts e.message
rescue ZeroDivisionError => e
  puts "ゼロによる割り算は許可されていません"
rescue StandardError => e
  puts e.message
end