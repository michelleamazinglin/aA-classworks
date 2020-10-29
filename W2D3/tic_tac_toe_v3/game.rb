require_relative "./board.rb"
require_relative "./human_player.rb"


class Game

    def initialize(n, *marks)
        @players = []
        marks.each do |mark|
            @players << HumanPlayer.new(mark)
        end
    
        @board = Board.new(n)
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
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