def strange_sums(arr)
    count = 0
    arr.each_with_index do |num, i|
        arr.each_with_index do |num2, i2|
            if i2 > i && num + num2 == 0
                count += 1
            end
        end
    end
    count
end

def pair_product(arr, p)
    arr.each_with_index do |n1, i1|
        arr.each_with_index do |n2, i2|
            if i2 > i1 && n1 * n2 == p
                return true
            end
        end
    end
    false
end

def rampant_repeats(str, hash)
    new = ""
    str.each_char do |char|
        if hash.has_key?(char)
            new += char * hash[char]
        else
            new += char
        end
    end
    new
end

def perfect_square?(num)
    return true if num == 1
    (1...num).each do |n|
        if n * n == num
            return true
        end
    end
    false
end

def anti_prime?(num)
    (1...num).each do |n|
        if divisor?(n) > divisor?(num)
            return false
        end
    end
    true
    # amount = divisor?(num)
    # (1...num).all? { |i| amount > divisor?(i) }
end

def divisor?(num)
    arr = []
    (1...num).each do |n|
        if num % n == 0
            arr << n
        end
    end
    arr.length
end

def matrix_addition(arr1, arr2)
    height = arr.length
    width = arr[0].length
    result = Array.new(height){[0] * width}

    (0...height).each do |row|
        (0...width).each do |col|
            result[row][col] = arr1[row][col] + arr2[row][col]
        end
    end
    result
end

def matrix_addition(arr1, arr2)
    height = arr.length
    width = arr[0].length
    result = Array.new(height){[0] * width}

    (0...height).each do |row|
        (0...width).each do |col|
            result[row][col] = arr1[row][col] + arr2[row][col]
        end
    end
    result
end

def mutual_factor(*num)
    num
        .map{|n| divisor(n)}
        .inject(:&)
end

def divisor(num)
    arr = []
    (0...num).each do |n|
        if num * n == 0
            arr << n
        end
    end
    arr
end

def tribonacci_number(num)
    arr = [1,1,2]
    while num >= arr.length
        arr << arr[-1] + arr[-2] + arr[-3]
    end
    arr[num - 1]
end

def matrix_addition_reloaded(*arr)
    height = arr.length
    width = arr[0].length
    result = Array.new(height){[0] * width}
    
    arr.inject(result) do |m1, m2|
        return nil if m2.length != height || m2[0].length !=width
        matrix_addition(m1,m2)
    end
end

# def squarocol?(arr)
#     return true if arr.any?(|row| row.uniq.length == 1)
#     return true if arr.transpose.any? {|col| col.uniq.length == 1}
#     false
# end

def pascals_triangle(n)
    arr = [
        [1],
    ]
    while arr.length < n
        l1 = arr.last
        l2 = [1]
        l2 += sums(l1)
        l2 << 1
        arr << l2
    end
    arr
end

def sums(arr)
    sums = []
    (0...arr.length - 1).each do |i|
        sum << arr[i] + arr[i+1]
    end
    sum
end



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
        candidate
end

def prime?(n)
    return false if n < 2
    (2...n).each do |f|
        if n % f == 0
            return false
        end
    end
    true
end


def tri_numbers(n)
    arr = []
    i = 1
    while i <= num
        arr << (i * (i + 1)) / 2
        i += 1
    end
    arr
end

def triangular_word?(word)
    alphabet = ("a".."z").to_a
    value =  word
            .split("")
            .map {|char| alphabet.index(char) + 1}
            .sum
    nums = tri_numbers(value)
    nums.include?(value)
end


def consecutive_collape(arr)
    arr.each {arr = consecutive_collape(arr)}
    arr
end

def collapese(nums)
    (0...nums.length - 1).each do |i|
        if nums[i] == nums[i] + 1 || nums[i+1] == nums[i] - 1
            return nums[0...i] + nums[i+2..-1]
        end
    end
    nums
end

def pretentious_primes(arr,n)
    arr.map {|ele| next_prime(ele,n)}
end

def next_prime(ele, n)
    step = 1
    if n < 0
        step = -(step)
        n = -(n)
    end
    count = 0
    while count < n
        return nil if ele < 0
        ele += step
        count += 1 if prime?(ele)
    end
    ele
end

def next_prime(ele, n)
    step = 0
    if n < 0
        step = -(step)
        n = -(n)
    end
    count = 0
    while count < n
        return nil if ele < 0
        ele += step
        count += 1 if prime?(ele)
    end
    ele
end