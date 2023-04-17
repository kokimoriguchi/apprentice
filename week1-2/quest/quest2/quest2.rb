def number
    puts "好きな数値を入力してください"
    input_value = gets.to_i
    puts "2倍の数字です:#{ input_value * 2}"
end
number()