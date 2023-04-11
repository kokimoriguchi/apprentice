#skill_level_1：Hello World
def hello
    puts "Hello World"
end
hello();

#skill_level_1：：挨拶
def greeting(name = String)
    puts "おはよう、#{name}!"
end
greeting("渡部");

#skill_level_1：三角形の面積
def area(x = Integer, y = Integer)
    if 1 <= x && x <= 100 && 1 <= y && y <= 100
        puts x * y
    else
        puts "error"
    end
end
area(4, 3);

#skill_level_1：比較
def greater(x = Integer, y = Integer)
    if x > y
        puts "x > y"
    elsif x < y
        puts "x < y"
    else x == y
        puts "x == y"
    end
end
greater(-50, -50);

#skill_level_1：電車の料金
def train_fare(age)
    if age.nil?
        puts "整数を入力してください"
    elsif !age.is_a?(Integer)
        puts "整数を入力してください"
    elsif age >= 12
        puts 200
    elsif age >= 6 && age <= 12
        puts 100
    else age < 6
        puts 0
    end
end
train_fare(3)

#skill_level_1：XOR
def xor(x, y)
    if (x || y) && !(x && y)
      puts true
    else
      puts false
    end
end
xor(true, false)

#skill_level_1：繰り返し処理_挨拶
def hello()
    hello = ["こんにちは！\n"]
    hello.each do |i|
        puts i * 5
    end
end
hello()

#skill_level_1：繰り返し処理_羊
def sheep(n)
    n.times do |i|
      puts "羊が#{i+1}匹"
    end
end
sheep(3)

#skill_level_1：繰り返し処理_総和1
def sum_1_100
    number = [*1..100]
    sum = 0
    number.each do |i|
        sum += i
    end
    puts sum
end
sum_1_100()

#skill_level_1：繰り返し処理_総和2
def sum (x, y)
    numbers = [*x..y]
    total = 0
    numbers.each do |i|
        total += i
    end
    puts total
end
sum(10, 80)

#skill_level_1：繰り返し処理_フィボナッチ数列(advanced)
def fibonacci(n)
    if n == 0
        return 0
    elsif n == 1
        return 1
    else
        return fibonacci(n-1) + fibonacci(n-2)
    end
end
puts fibonacci(7)