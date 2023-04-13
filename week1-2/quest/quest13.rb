#1例外
=begin
　・例外とは何か
　　→
　・何の為にあるのか
　　→
=end

#2電卓
def calculate(num1, num2, operator)
    # クラスを完成させてください
  end

  puts "1番目の整数を入力してください:"
  num1 = gets.chomp.to_f

  puts "2番目の整数を入力してください:"
  num2 = gets.chomp.to_f

  puts "演算子(+, -, *, /)を入力してください:"
  operator = gets.chomp

  begin
    result = calculate(num1, num2, operator)
    puts result
  rescue # 例外処理を記載してください
  end