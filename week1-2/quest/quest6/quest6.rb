#skill_level_1：繰り返し処理_挨拶
def hello()
    hello = ["こんにちは！\n"]
    hello.each do |i|
        puts i * 100
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