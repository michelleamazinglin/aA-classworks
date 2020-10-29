require "byebug"

class Board
    attr_reader :size
  def initialize(n)
    @grid = Array.new(n){Array.new(n,:N)}
    @size = n * n
  end
  
  def [](arr)
    row = arr[0]
    col = arr[1]    
    @grid[row][col] 
  end

  def []=(pos, val)
    #row,col = pos 
    row = pos[0]
    col = pos[1]
    @grid[row][col] = val
  end
  
  def num_ships
    @grid.flatten.count {|ele|ele ==:S}
  end
  
  def attack(pos)
    # row,col = pos
    # result = self[pos]
    #  debugger
    if  self[pos] == :S 
        self[pos] = :H
        puts "you sunk my battleship!"
        return true
    else
        self[pos]= :X
        return false
    end
  end

  def place_random_ships
    ships = @size * 0.25
    while self.num_ships < ships

        rand_row = rand(0...@grid.length)
        rand_col = rand(0...@grid.length)
        pos = [rand_row,rand_col]
        val = :S
        self[pos]= val
    end
  end

  def hidden_ships_grid
    new_grid = Array.new(@grid.length){Array.new(@grid.length,:N)}
    @grid.each_with_index do |sub,i|
        sub.each_with_index do |ele,j|
            if ele == :S
               new_grid[i][j] = :N
            else
                new_grid[i][j] = ele
            end
        end
    end
    return new_grid
  end

  def self.print_grid(grid)
    grid.each do |sub|
        #sub.each do |el|
        (0...sub.length-1).each do |i|
            print "#{sub[i]} "
        end
        print "#{sub[-1]}"
        print "\n"
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
