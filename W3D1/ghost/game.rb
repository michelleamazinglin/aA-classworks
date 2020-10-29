class Game

    @@dictionary = Hash.new{|h,k| h[k] = Array.new}

    File.open('dictionary.txt').each do |line|
        @@dictionary[line[0]] << line.chomp


        # #key = a word

        # key = letter
        # value = [array of words that start with the key]

    end


    def self.dictionary
        @@dictionary
    end

    def initialize()
        @player_1 = Player.new()
        @player_2 = Player.new()
        @current_player = @player_1
        @previous_player = @player_2
        @fragment = ""
    end

    def previous_player
        if @current_player == @player_1
            @previous_player = @player_2
        else
            @previous_player = @player_1
        end 
    end

    def next_player!
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
        self.previous_player
    end

    def take_turn(player) # @player1 or @player2
        # get the letter from the current player's guess
        # append the letter to fragment
        # [optional] check fragment to see if it's a valid beginning of a word
        # check if fragment is a key in @@dictionary... if yes, the game is over
        guess = player.guess  #Player#guess must return a single character
        @fragment << guess
        words = @@dictionary[@fragment[0]]
        words.each do |word|
            
        end

        #dictionary[@fragment+*]  fragment = te
        
    end
end

# if ture continue with the game, if false, you lose!!