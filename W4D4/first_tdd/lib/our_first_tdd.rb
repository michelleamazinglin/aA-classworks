def my_uniq(arr)
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1
    end
    hash.keys
end

class Array
    def two_sum
        result = []
        (0...self.length - 1).each do |i1|
            (i1 + 1...self.length).each do |i2|
                result << [i1,i2] if self[i1] + self[i2] == 0
            end
        end
        result
    end
end

def my_transpose(grid)
    raise "This should be a square" unless grid.all? { |subarr| subarr.length == grid.length }
    new_grid = Array.new(grid[0].length) { Array.new(grid.length) }
    grid.each_with_index do |subarr, i|
        subarr.each_with_index do |ele, j|
             new_grid[j][i] = ele
        end
    end
    new_grid
end

def stock_picker(prices)
    raise "Need more data" if prices.length <= 1
    best_pair = nil
    best_profit = 0
    (0...prices.length - 1).each do |i1|
        (i1 + 1...prices.length).each do |i2|
            current_profit = prices[i2] - prices[i1]
            if current_profit > best_profit
                best_profit = current_profit
                best_pair = [i1,i2]
            end
        end
    end
    best_pair
end

class Game
    attr_accessor :towers

    def initialize
        @towers = Array.new(3) { Array.new }
        @towers[0] = [3, 2, 1]
    end

    def move(start_pos, end_pos)
        start_disk = @towers[start_pos].last
        end_disk = @towers[end_pos].last
        if !@towers[start_pos].empty? && !@towers[end_pos].empty? && start_disk > end_disk
            raise "no bigs on smalls" 
        end
        raise "can not move from empty tower" if @towers[start_pos].empty?

        @towers[end_pos] << @towers[start_pos].pop
        # self[end_pos] << self[start_pos].pop
    end

    def won?
        @towers[1] == [3,2,1] || @towers[2] == [3,2,1]
    end
end