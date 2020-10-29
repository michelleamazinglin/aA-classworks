class Card
    VALUES = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    SUITS = ["HEART", "DIAMOND", "CLUB", "SPADE"]

    attr_reader :suit, :value

    def initialize(suit,value)
        raise "Invalid suit" unless SUITS.include?(suit)
        raise "Invalid value" unless VALUES.include?(value)
        @suit = suit
        @value = value
    end

    def to_s
        @suit[0] + @value
    end
end