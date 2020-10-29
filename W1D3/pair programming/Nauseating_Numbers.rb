#Write a method strange_sums that accepts an array of numbers as an argument. 
#The method should return a count of the number of distinct pairs of elements 
#that have a sum of zero. You may assume that the input array contains unique elements.
def strange_sums(array)
    count = 0
    array.each_with_index do |num1, idx1|
        array.each_with_index do |num2, idx2|
            if idx2 > idx1 && num1 + num2 == 0
                count += 1
            end
        end
    end
    count
end

#Write a method rampant_repeats that accepts a string and a hash as arguments. 
#The method should return a new string where characters of the original string 
#are repeated the number of times specified by the hash. If a character does not
# exist as a key of the hash, then it should remain unchanged.

def rampant_repeats(string, hash)
    answer = ""
    string.each_char do |char|
        if hash.has_key?(char)
            answer += char * hash[char]
        else
            answer += char
        end
    end
    answer
end

#Write a method perfect_square? that accepts a number as an argument. 
#The method should return a boolean indicating whether or not the argument is a perfect square. 
#A perfect square is a number that is the product of some number multiplied by itself. For example, s
#ince 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 35 is not a perfect square.

def perfect_square(num)
    return true if num == 1
    (0...num).each do |n|
        if n*n == num
            return true
        end
    end
    return false
end

#Write a method anti_prime? that accepts a number as an argument. 
#The method should return true if the given number has more divisors than all positive numbers less than the given number. 
#For example, 24 is an anti-prime because it has more divisors than any positive number less than 24. 
#Math Fact: Numbers that meet this criteria are also known as highly composite numbers.

def anti_prime?(num)
    most_factors = 0
    (1..num).each do |n|
        if num_factors(n) > most_factors
            most_factors = num_factors(n)
        end
    end
    most_factors == num_factors(num)
end

def num_factors(num)
    count = 0
    (1...num).each do |n|
        if num % n == 0
            count += 1
        end
    end
    count
end

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

def matrix_addition(matrix1, matrix2)
    
    height = matrix1.length
    width = matrix1[0].length
    answer = Array.new(height) {Array.new(width) {0}}

    # matrix1.each_with_index do |subarr1,idx1|
    #     matrix2.each_with_index do |subarr2,idx2|

    (0...height).each do |h|
        (0...width).each do |w|
            answer[h][w] = matrix1[h][w] + matrix2[h][w]
        end
    end
    answer
end

#Write a method mutual_factors that accepts any amount of numbers as arguments. 
#The method should return an array containing all of the common divisors shared among the arguments. 
#For example, the common divisors of 50 and 30 are 1, 2, 5, 10. You can assume that all of the arguments are positive integers.

def mutual_factors(*nums)
    arrays = []
    answer = []
    hash = Hash.new(0)

    nums.each do |num|
        arrays << divisors(num)
    end

    arrays.flatten.each do |n|
        hash[n] += 1
    end

    hash.each do |k, v|
        if v == nums.length
            answer << k
        end
    end
    answer
end

def divisors(num)
    arr = []
    (1..num).each do |n|
        if num % n == 0
            arr << n
        end
    end
    arr
end

#The tribonacci sequence is similar to that of Fibonacci. 
#The first three numbers of the tribonacci sequence are 1, 1, and 2. 
#To generate the next number of the sequence, we take the sum of the previous three numbers. 
#The first six numbers of tribonacci sequence are:
#1, 1, 2, 4, 7, 13, ... and so on
#Write a method tribonacci_number that accepts a number argument, n, and returns the n-th number of the tribonacci sequence.

def tribonacci_number(n)
    array = [1,1,2]
    i = 2
    while i <= n
        array << array[-1] + array[-2] + array[-3]
        i += 1
    end
    array[n-1]
end

#Write a method matrix_addition_reloaded that accepts any number of matrices as arguments.
# The method should return a new matrix representing the sum of the arguments. 
#Matrix addition can only be performed on matrices of similar dimensions, 
#so if all of the given matrices do not have the same "height" and "width", then return nil.

def matrix_addition_reloaded(*matrix)
    # height = matrix.length
    # width = 2
    # answer = Array.new(height) {Array.new(2) {0}}
    # p answer
    # answer.each do so |m1, m2|
    matrix1 = matrix.first
    height = matrix1.length
    width = matrix1[0].length
    answer = Array.new(height) {Array.new(2) {0}}
    # answer = Array.new(height) {Array.new(0) * width}
    # matrix.inject(answer) do |acc,ele| 
    #     if acc.length != height && acc[0].length != width
    #         return nil
    #     end
    #     matrix_addition(acc,ele)
    # end
    matrix.each do |subarr|
        if subarr.length != matrix[0].length
            return nil
        end
        (0...height).each do |h|
            (0...2).each do |w|
                answer[h][w] = answer[h][w] + subarr[h][w]
            end
        end
    end

    # (0...height).each do |h|
    #     (0...width).each do |w|
    #         answer[h][w] = matrix1[h][w] + matrix2[h][w]
    #     end
    # end
    answer
end
    

#Write a method squarocol? that accepts a 2-dimensional array as an argument. 
#The method should return a boolean indicating whether or not any row or column is completely filled with the same element. 
#You may assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

def squarocol?(matrix)
    height = matrix.length
    width = matrix.length
    column_matrix = Array.new(height) {Array.new(width) {0}}
    # p answer
    matrix.each do |row|
        return true if row.all?(row[0])
    end
    (0...height).each do |row|
        (0...height).each do |col|
            column_matrix[row][col] = matrix[col][row]
        end
    end
    column_matrix.each do |row|
        return true if row.all?(row[0])
    end
false     
end

#Write a method squaragonal? that accepts 2-dimensional array as an argument. 
#The method should return a boolean indicating whether or not the array contains all of the same element across either of its diagonals. 
#You may assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

def squaragonal?(matrix)
    height = matrix.length
    width = matrix.length
    diagonals1 = []
    diagonals2 = []
    reverse_matrix = []
    (0...height).each do |row|
        (0...height).each do |col|
            if row == col
                diagonals1 << matrix[row][col]
            end
        end
    end
    matrix.each do |row|
        reverse_matrix << row.reverse
    end
    (0...height).each do |row|
        (0...height).each do |col|
            if row == col
                diagonals2 << reverse_matrix[row][col]
            end
        end
    end
    
    return true if diagonals1.all?(diagonals1[0])
    return true if diagonals2.all?(diagonals2[0])
    false
end


#Pascal's triangle is a 2-dimensional array with the shape of a pyramid. 
#The top of the pyramid is the number 1. To generate further levels of the pyramid, 
#every element is the sum of the element above and to the left with the element above and to the right. 
#Nonexisting elements are treated as 0 when calculating the sum. For example, here are the first 5 levels of Pascal's triangle:
 #     1
 #    1 1
 #   1 2 1
 #  1 3 3 1
 # 1 4 6 4 1
#Write a method pascals_triangle that accepts a positive number, n,
# as an argument and returns a 2-dimensional array representing the first n levels of pascal's triangle.

def pascals_triangle(n)
    answer = [[1]]
    while answer.length < n
        level_1 = answer.last
        level_2 = [1]
        level_2 += adjacent_sum(level_1)
        level_2 << 1
        #level_2[1].flatten
        answer << level_2
    end
    answer
end

def adjacent_sum(arr)
    # p arr # [1]
    sum = []
    (0...arr.length - 1).each do |i|
        # p array
        # p array[i]
        # p array[i + 1]
        sum << arr[i] + arr[i+1]
    end
    sum
end



p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]