require_relative "./board.rb"
require_relative "./human_player.rb"


class Game

    def initialize(mark1,mark2)
        @player1 = HumanPlayer.new(mark1)
        @player2 = HumanPlayer.new(mark2)
        @board = Board.new
        @current_player = @player1
    end

    def switch_turn
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos,@current_player.mark)
            if @board.win?(@current_player.mark)
                puts "victory" 
                puts "#{@current_player.mark} has won the game"
                return
            else
                switch_turn
            end
        end
        puts "draw"
        return
    end
end