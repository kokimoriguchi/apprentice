#skill_level_1：Hello World
def hello
    puts "Hello World"
end
puts hello();

#skill_level_1：：挨拶
def greeting(name = String)
    puts "おはよう、#{name}!"
end
puts greeting("渡部");

#skill_level_1：三角形の面積
def area(x = Integer, y = Integer)
    if 1 <= x && x <= 100 && 1 <= y && y <= 100
        puts x * y
    else
        puts "error"
    end
end
puts area(4, 3);

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
puts greater(-50, -50);

#skill_level_1：電車の料金
def train_fare(age)
    if age.nil?
        puts "整数を入力してください"
    elsif !age.is_a?(Integer)
        puts "整数を入力してください"
    elsif age >= 12
        puts 200
    elsif age >= 6 && age = 12
        puts 100
    else age < 6
        puts 0
    end
end
puts train_fare(3)

#skill_level_1：XOR
def xor(x, y)
    if (x || y) && !(x && y)
      return true
    else
      return false
    end
end
puts xor(true, false)