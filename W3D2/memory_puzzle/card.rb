#A Card has two useful bits of information: its face value, 
#and whether it is face-up or face-down.


# #hide, #reveal, #to_s, and #== methods.

class Card

    POSSIBLE_LETTERS = ["A","B","C","D","E","F","G","H"]

    def initialize(char)
        # @cards = ("A".."H").to_a
        @face_up = true
        @char = POSSIBILE_LETTERS.sample
        
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    # def to_s

    # end

    # def ==
    # end

end