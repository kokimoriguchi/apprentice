#1each
def print_names(names)
    names.each.with_index(1) do |names, i|
        puts "#{i}:#{names}"
    end
end
print_names(['上田', '田仲', '堀田'])

#2map
def square(numbers)
    squared_numbers = numbers.map {|n| n ** 2}
end
squared_numbers = square([5, 7, 10])
print squared_numbers

#3select
def select_even_numbers(numbers)
    even_numbers = numbers.select{ |n| n.even? } #.evenメソッドは偶数であれば真を返すメソッド。
end
even_numbers = select_even_numbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
print even_numbers