# The Board is responsible for keeping track of all your Cards. 
# You'll want a grid instance variable to contain Cards. Useful methods:

class Board

    def initicalize
        # @cards = ("A".."H").to_a
        @grid = Array.new(4){Array.new(4)}
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos,value)
        row, col = pos
        @grid[row][col] = value
    end


    def populate  #put cards in
            # 2.times do 
            #     POSSIBLE_LETTERS.shuffle.each do |letter|
            #         (0...4).each do |i|
            #             (0...4).each do |j|
            #                 grid[i][j] = letter
            #             end
            #         end
            #     end
            # end
            #letter * 2 #take this put in anywhere in @grid
            cards = POSSIBLE_LETTERS.shuffle
            cards.each do |char|
                grid = Array.new(4){Array.new(4){char}}
            end
            
    end

    def render  #resentation of current state
        @grid
    end

    def won?  #return boolean if all cards have in revealed
        if @grid.flatten.all?(@face_up)
            puts "you win!"
            return true 
        else
            false
        end
    end

    def reveal(guessed_pos)  #do nothing if face up == true.... return value of the card it revealed
        if @face_up == false
            @face_up == true
        end
        
    end
end