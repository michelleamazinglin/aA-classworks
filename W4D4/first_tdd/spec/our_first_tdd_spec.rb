require "rspec"
require "our_first_tdd"

describe "my_uniq" do
    it "return unique array" do
        expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
    end
end

describe "Array#two_sum" do
    it "returns a 2d array of indices that adds up to 0" do
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
end

describe "my_transpose" do
    it "returns the transposed 2D array" do
        grid = [
                [0, 1, 2],
                [3, 4, 5],
                [6, 7, 8]
                        ]
        new_grid = [
                [0, 3, 6],
                [1, 4, 7],
                [2, 5, 8]
                        ]
        expect(my_transpose(grid)).to eq(new_grid)
    end

    it "should raise an error if the grid is not a square" do
        grid = [
                [0, 1, 2],
                [3, 4, 5],
                [6, 7, 8, 6]
                        ]
        expect { my_transpose(grid) }.to raise_error("This should be a square")
    end
end

# prices = [400,10,500]
# index0 = day 0
# max_num, min_num
# max <= index  >   min <= index

describe "stock_picker" do
    it "returns the best difference between sell day and buy day" do
        prices = [0,100, 50, 10, 1000]
        expect(stock_picker(prices)).to eq([0,4])
    end
    it "can't sell before you buy it" do
        prices = [1000,100, 50, 10, 0]
        expect(stock_picker(prices)).not_to eq([0,4])
    end
    it "can't buy or sell if we dont have at least two prices" do
        prices = [10000]
        expect { stock_picker(prices) }.to raise_error("Need more data")
    end
end

# class of this game
# 3 arrs
#[1]    [2]    [3]
# user   select a arr     put a arr
#[[],[],[]]
# tree stacks
describe Game do
    let(:game){Game.new()}  #Game.new()
    describe "Game#initialize" do
        it "sets three towers" do
            expect(game.towers[0]).to eq([3,2,1])
            expect(game.towers[1]).to eq([])
            expect(game.towers[2]).to eq([])
        end
        
        # it "sets a starting position" do
        #     expect(game.start_pos).to eq()
        # end
    end
    # we need to set pos in initialize, two argument start_pos, end_pos

    describe "Game#move" do
        it "should select a starting and a ending tower to move the disk" do
            game.move(0,1)
            expect(game.towers[0]).to eq([3,2])
            expect(game.towers[1]).to eq([1])
        end

        it "can not move a disk from an empty tower" do
            expect{game.move(2,1)}.to raise_error("can not move from empty tower")
        end

        it "can not put a larger disk on a smaller disk" do
            game.move(0,1)
            expect{game.move(0,1)}.to raise_error("no bigs on smalls")
        end
    end
    # you cant take disk if there is no disk
    # you can not put bigger value on top of smaller value

    describe "Game#won?" do
        it "returns true when the disks are in the right order" do
            win1 = [[], [], [3,2,1]]
            game.towers = win1
            expect(game.won?).to eq(true)
        end
        it "returns true when the disks are in the right order" do
            win2 = [[], [3,2,1], []]
            game.towers = win2
            expect(game.won?).to eq(true)
        end
    end
end