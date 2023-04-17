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