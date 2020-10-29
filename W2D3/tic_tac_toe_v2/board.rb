# [
#     [:X, :O, '_'],
#     [:O, :X, '_'],
#     ['_', '_', :X],
# ]

class Board
    def initialize(n)
        @grid = Array.new(n){Array.new(n,"_")}
    end

    def valid?(pos)
        length = @grid.length
        width = @grid[0].length
        pos.each do |num|
            if !(0...length).include?(num)
                return false
            end
        end
        return true
    end

    def empty?(pos)
        row,col = pos
        @grid[row][col] == "_"

    end

    def place_mark(pos, mark)
        if !valid?(pos) || !empty?(pos)
            raise "Not valid or not empty"
        else
            row,col = pos
            @grid[row][col] = mark
        end
    end

    def print
        @grid.each do |sub|
            p sub#.join(" ")
            puts
        end
        return
    end
    
    def win_row?(mark)
        @grid.any? {|sub| sub.all? (mark)}
    end
    
    def win_col?(mark)
        @grid.transpose.any? {|sub| sub.all? (mark)}
    end
   
    def win_diagonal?(mark)
        # new_arr1 = []
        
        # @grid.each do |sub|
        #     i = 0
        #     while i < @grid.length
        #         new_arr1 << sub[i]
        #     end
        #     i+=1
        # end
        count = 0
        @grid.each_with_index do |sub, i|
            if @grid[i][i] == mark
                count +=1
            end
        end
        
        count2 = 0
        @grid.reverse.each_with_index do |sub, i|
            if @grid.reverse[i][i] == mark
                count2 += 1
            end
        end

        return true if count == @grid.length || count2 == @grid.length

        # new_arr2 = []
        # @grid.each do |sub|
        #     j = @grid.length-1
        #     while j >= 0
        #         new_arr2 << sub[j]
        #     end
        #     j-=1
        # end

        # if new_arr2.all?(mark) || new_arr1.all?(mark)
        #     return true
        # else
        #     return false
        # end
    end

    def win?(mark)
        if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
            return true
        else
            return false
        end
    end
    

    def empty_positions?
        @grid.flatten.include? ("_")
    end
end
