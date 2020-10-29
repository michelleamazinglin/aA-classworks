require_relative "piece.rb"

class Board
    
    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8, nil)}
        populate_rows
    end

    def populate_rows
        indices = [0,1,6,7]
        @rows.each_with_index do |row, i|
            if indices.include?(i)
                row.each_with_index do |ele, j|
                    @rows[i][j] = Piece.new
                end
            end
        end
    end

        #index of each row #map over each ele with Piece.new
    # @rows[0] @rows[1]      @rows[6] @rows[7]     = piece instances
    #all other row will be nil

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, piece)
        row, col = pos
        @rows[row][col] = piece
    end

    def move_piece(start_pos, end_pos) #color comes in later phases
        #raise an exception if
        #1. there is no piece at start pos
        #2. the piece cannot move to end pos
        raise "you are not at starting pos" if self.[](start_pos).empty?

    end


    def move_piece!(start_pos, end_pos) #(color, start_pos, end_pos) we don't need color yet
        #check for possible moves?
        #valid move?   we can call valid pos
        if !self[start_pos].empty? 
            piece = self[start_pos] #the piece at start pos
        else
            raise 'there is no piece at start position'
        end

        if !valid_pos(end_pos) #if its not valid pos it will return false
            raise "the piece cannot move there"
        end

    end

    def valid_pos?(pos)
        row, col = pos
        row.between?(0..7) && col.between?(0..7)
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end

    def checkmake?(color)
    end

    def in_check?(color)
    end

    def find_king(color)
    end

    def pieces
        arr = []
        @rows.flatten.each do |subarr|
            if !subarr.empty?
                arr << subarr
            end
        end
        arr
    end

    def dup
        @rows.dup
    end


    private
    # def initialize
    #     @sentinel = NullPiece.instance
    # end


    #Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
end