def strange_sums(arr)
    count = 0
    arr.each_with_index do |ele1, i1|
        arr.each_with_index do |ele2, i2|
            if i2 > i1 && ele1 + ele2 == 0
                count += 1
            end
        end
    end
    count
end
# p strange_sums([2,-3,3,4,-2]) #2
# p strange_sums([42,3,-1,-42]) #1
# p strange_sums([-5,5]) #1
# p strange_sums([19,6,-3,-20]) #0
# p strange_sums([9]) #0

def pair_product(arr, product)
    arr.each_with_index do |num1, i1|
        arr.each_with_index do |num2, i2|
            if i2 > i1 && num1 * num2 == product
                return true
            end
        end
    end
    false
end
# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(str,hash)
    newStr = ""
str.each_char do |char|
    if hash.has_key?(char)
        newStr += char * hash[char]
    else
        newStr += char
    end
end
newStr
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})               # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3})   # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})            # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})              # 'faaaarm'

def perfect_square(num)
    if num == 1
        return true
    end

    (1...num).each do |n|
        if n * n == num
            return true
        end
    end
    false
end
# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

def num_factors(n)
    (1..n).count { |i| n % i == 0 }
end

def anti_prime?(n)
    amount = num_factors(n)
    (1...n).all? { |i| amount > num_factors(i) }
end

# p anti_prime?(24)     # true
# p anti_prime?(36)     # true
# p anti_prime?(48)     # true
# p anti_prime?(360)    # true
# p anti_prime?(1260)   # true
# p anti_prime?(27)     # false
# p anti_prime?(5)      # false
# p anti_prime?(100)    # false
# p anti_prime?(136)    # false
# p anti_prime?(1024)   # false

def matrix_addition(arr1,arr2)
    height = arr1.length
    width = arr1[0].length
    result = Array.new(height){[0] * width} #Array.new[3] => [[][][]]

    (0...height).each do |row|
        (0...width).each do |col|
            result[row][col] = arr1[row][col] + arr2[row][col]
        end
    end
    result 
end
# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]
# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*num)
    num
        .map{|n| divisor(n)}
        .inject(:&)
end

def divisor(num)
    arr = []
    (1..num).each do |n|
        if num % n == 0
            arr << n
        end
    end
    arr
end
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(num)
    arr = [1,1,2]
    while arr.length <= num
        sum = arr[-1] + arr[-2] + arr[-3]
        arr << sum
    end
    arr[num - 1]
end
# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*arrs)
    arr = arrs.first
    height = arr.length
    width = arr[0].length
    final = Array.new(height){[0] * width}

    arrs.inject(final) do |m1,m2|
        return nil if m2.length != height || m2[0].length != width
        matrix_addition(m1,m2)
    end
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]
# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(arr)
    return true if arr.any? {|row| row.uniq.length == 1}
    return true if arr.transpose.any? {|col| col.uniq.length == 1}
    false       
end

# p squarocol?([
#     [:o, :x , :o],
#     [:o, :x , :o],
#     [:o, :x , :o],
# ]) # true
# p squarocol?([
#     [:o, :o, :o],
#     [:o, :o, :o],
#     [:x, :x, :x],
# ]) # true
# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false
# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true
# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(arr)
end


def pascals_triangle(num)
    triangle = [[1]]
    while triangle.length < num
        level_above = triangle.last
        next_level = [1]
        next_level += adjecent_sums(level_above)
        next_level << 1
        triangle << next_level
    end
    triangle
end

def adjecent_sums(arr)
    sum = []
    (0...arr.length - 1).each do |i|
        sum << arr[i] + arr[i+1]
    end
    sum
end

# p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

# p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]

def mersenne_prime(num)
    x = -1
    count = 0
    while count < num
        x += 1
        candidate = 2**x - 1
        if prime?(candidate)
            count += 1
        end
    end
        2**x -1
end

def prime?(num)
    return false if num < 2
    (2...num).each do |n|
        if num % n == 0
            return false
        end
    end
    true
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_word?(word)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    value = word
        .split("")
        .map {|char| alphabet.index(char) + 1}
        .sum
    nums = triangular_sequence(value)
    nums.include?(value)
end

def triangular_sequence(num)
    arr =[]
    i = 1
    while i <= num
        arr << (i * (i + 1)) / 2
        i += 1
    end
    arr
end
# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(arr)
    arr.each {arr = collapse(arr)}
    arr
end

def collapse(nums)
    (0...nums.length - 1).each do |i|
        if nums[i] + 1 == nums[i + 1] || nums[i] == nums[i+1] + 1
            return nums[0...i] + nums[i + 2..-1]
        end
    end
    nums
end
p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []

def pretentious_primes(arr, num)
    arr.map {|n| next_prime(n,num) }
end

def next_prime(num, i)
    step = 1
    if i < 0
        i = -(i)
        step = -(step)
    end
    prime_count = 0
    while prime_count < i
        return nil if num < 0
        num += step
        prime_count += 1 if prime?(num)
    end
    num
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]

