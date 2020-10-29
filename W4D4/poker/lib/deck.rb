require_relative "card.rb"

class Deck
    attr_reader :length, :cards
    def initialize
        @length = 52
        @cards = []
        Card::SUITS.each do |suit|
            Card::VALUES.each do |value|
                @cards << Card.new(suit,value)
            end
        end
    end

    def draw_card
        raise "Deck is empty" if length == 0
        @length -= 1
        @cards.pop
    end

    def shuffle
        @cards = @cards.shuffle
    end
end