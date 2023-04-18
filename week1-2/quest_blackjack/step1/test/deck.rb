require './card.rb'

class Deck
    def draw
        selected_type = @cards.keys.sample
        pp selected_type
    end
end
deck = Deck.new
deck.draw