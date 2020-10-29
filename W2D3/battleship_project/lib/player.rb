class Player 

    def get_move
        print "enter a position with coordinates separated with a space like `4 7`"
        input = gets.chomp
        arr = input.split(" ")
        arr.map!{|ele| ele.to_i}
        arr
    end

end
