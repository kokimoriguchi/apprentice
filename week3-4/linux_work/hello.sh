#!/bin/bash
echo "Hello!"
# ユーザーに名前を尋ねる
echo "What's your name?"
read name

# 入力された名前に対して挨拶を出力する
echo "Welcome, $name!"
echo "calculate"
echo "Enter two numbers:"
read num1
read num2

# 演算子を入力させる
echo "Choose an arithmetic operation (+, -, *, /):"
read operator

# 演算子に応じた計算を行う
if [ "$operator" = "+" ]; then
  result=$(($num1 + $num2))
elif [ "$operator" = "-" ]; then
  result=$(($num1 - $num2))
elif [ "$operator" = "*" ]; then
  result=$(($num1 * $num2))
elif [ "$operator" = "/" ]; then
  # 割る数が 0 の場合はエラーを出力する
  if [ "$num2" -eq 0 ]; then
    echo "Error: Cannot divide by zero"
    exit 1
  fi
  result=$(($num1 / $num2))
else
  # 演算子が不正な場合はエラーを出力する
  echo "Error: Invalid operator"
  exit 1
fi

# 結果を出力する
echo "The result: $result"

# 1 から 100 までの数字を繰り返し処理
# 変数 i には繰り返し回数が代入されます
for i in {1..100}
do
    # i が偶数かどうかを判定
    if (( $i % 2 == 0 ))
    then
        # i が偶数ならば表示
        echo $i
    fi
done