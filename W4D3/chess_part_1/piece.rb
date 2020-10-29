class Piece
    def initialize #(color, board, pos)
        # @color = color #datatype :white :black
        # @board = board   #board instence as an argument
        # @pos = pos #[row,col]
    end

    def inspect
        :P #represent the piece
    end

    def to_s

    end

    def empty?
    end

    def valid_moves
    end

    def pos=(val)
    end

    def symbol
    end

    private
    def move_into_check?(end_pos)
    end
end