require 'debug'

#
class Player

end

#
class Dealer

end

#
class Card
    type = [:club, :diamond, :heart, :spade]
    def initialize(type, number)
        @type = type
        @number = number
    end
end

#
class Deck < Card

end

#
class Rule

end






def initialize(arg = {})
human = {name: "simble", age: 27}
puts human[:name]
#ハッシュの引数で名前として扱いたい時、名前::値 チェリー本5.4.3参照
#ハッシュは基本数字として認識される。
arg.feach(name: "simble" )