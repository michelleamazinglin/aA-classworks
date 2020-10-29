#matrix_addition
#Let a 2-dimensional array be known as a "matrix". 
#Write a method matrix_addition that accepts two matrices as arguments. 
#The two matrices are guaranteed to have the same "height" and "width". 
#The method should return a new matrix representing the sum of the two arguments. 
#To add matrices, we simply add the values at the same positions:

# programmatically
#[[2, 5], [4, 7]] + [[9, 1], [3, 0]] => [[11, 6], [7, 7]]

# structurally
#2 5  +  9 1  =>  11 6
#4 7     3 0      7 7

def matrix_addition(arr1,arr2)  # arr1= [[2,5], [4,7]]     arr2 = [[9,1], [3,0]]
    height = arr1.length # height = 2
    width = arr1[0].length # width = 2
    new_arr = Array.new(height){[0] * width} # creates a new empty Arr [[0,0],[0,0]]

    (0...height).each do |row| # 0...2 loop
        (0...width).each do |col| #0...2 loop  底下loop完才会到上面那个loop
            new_arr[row][col] = arr1[row][col] + arr2[row][col] #new_arr[0][0] = arr1[0][0] + arr2[0][0] ....loop
                                                                #new_arr[0][1] = arr1[0][1] + arr2[0][1]
                                                                #new_arr[1][0] = arr1[1][0] + arr2[1][0]
                                                                #new_arr[1][1] = arr1[1][1] + arr2[1][1]
        end
    end
    #跳出来
    new_arr # [[11, 6], [7, 7]]
end


matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]




#zip
#  should accept any number of arrays of the same length as arguments
#  should return a 2D array where each subarray contains the elements at the same index from each argument


# def zip(*arrays) #array_1 = ['a', 'b', 'c']      array_2 = [1, 2, 3]    splat会变成一个arr
#     length = arrays.first.length #第一个array的length  3

#     (0...length).map do |i|       #  0...3
#         arrays.map { |array| array[i] }    # arrays << arr[0]    arrays << arr[1]    arrays << arr[2]
#     end
# end

def zip(*arrs)  #    [ ['a', 'b', 'c'],[1, 2, 3] ]   splat会变成一个arr
    n = arrs.first.length #3
    m = arrs.length #2

    arr = []
    (0...n).each do |i| #0,1,2
        subArr = []
        (0...m).each do |j| #0,1
            subArr << arrs[j][i]  # subArr << arrs[0][0]   subArr = ["a"]
                                  # subArr << arrs[1][0]   subArr = ["a",1]
        end
        arr << subArr              #arr << subArr arr = [["a",1]]
    end
    arr
end



array_1 = ['a', 'b', 'c']
array_2 = [1, 2, 3]
array_3 = ['w', 'x', 'y']

p zip(array_1, array_2)
#[
#           ["a", 1],
#           ["b", 2],
#           ["c", 3]
#       ]

p zip(array_2, array_1)

#[
#           [1, "a"],
#           [2, "b"],
#           [3, "c"]
#       ]

p zip(array_1, array_2, array_3)

#[
#           ["a", 1, "w"],
#           ["b", 2, "x"],
#           ["c", 3, "y"]
#       ]






#describe "#my_transpose" do
#it "should transpose a 2D array with square dimensions by returning a new 2D array where the horizontal rows are converted to vertical columns"


def my_transpose(arr)
    new_arr = Array.new(arr[0].length){Array.new(arr.length)}  #[[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    arr.each_with_index do |subArr, i|  # 0 == ["a", "b", "c"]    1 == ["d", "e", "f"]   3 == ["g", "h", "i"]
        subArr.each_with_index do |ele,j|  # ["a"]   ["b"]   ["c"]
            new_arr[j][i] = ele   # new_arr[0][0] = a
                                  # new_arr[1][0] = b
                                  # new_arr[2][0] = c
                                  # new_arr[0][1] = d
        end
    end
    new_arr
end


arr_1 = [
         ["a", "b", "c"],
         ["d", "e", "f"],
         ["g", "h", "i"]
]
expected_1 = [
        ["a", "d", "g"],
        ["b", "e", "h"],
        ["c", "f", "i"]
]

p my_transpose(arr_1) == expected_1

arr_2 = [
          ["w", "x"],
          ["y", "z"]
        ]

expected_2 = [
          ["w", "y"],
          ["x", "z"]
        ]

p my_transpose(arr_2) == expected_2