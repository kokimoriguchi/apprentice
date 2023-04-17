#skill_level_1：三角形の面積
def area(x = Integer, y = Integer)
    if 1 <= x && x <= 100 && 1 <= y && y <= 100
        puts x * y
    else
        puts "error"
    end
end
area(4, 3);
