require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        mult = n*n
        @board = Board.new(n)
        @remaining_misses = mult / 2 
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        @board.print
    end
    
    def lose?
        if @remaining_misses <= 0
            print "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships < 1
            print "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        if win? || lose?
            return true
        else
            return false
        end
    end

    def turn
        move = @player.get_move
        if !@board.attack(move)
             @remaining_misses -= 1
        end
        @board.print
        p @remaining_misses
    end
    
end
