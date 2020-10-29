

def range(num1,num2)
    return [] if num2 <= num1 #never happen
    arr = [] # arr = [1]       arr= [2]     arr = [3]    arr = [4]
    next_num = num1 + 1 #next = 2    next = 3       next= 4     next = 5
    arr << next_num # arr [1,2]        arr = [2,3]    arr[3,4]      arr = [4,5] 
    #arr << next num #looping until the base case  
    arr += range(next_num, num2) #range(2,5)     range(3,5) =>[3,4]     range(4,5) => [4,5]              range [5,5] => []
    ([num1] + arr - [num2]).uniq
end 

#range(1,4)
# => 1,2 
# => 1 + (2..3)


# p range(1,5)
# # 1(n1),2,3,4
# # 1(n1) + 1 = 2
# #print n1, n1 + 1
# #until we hit 4 (n2 - 1)
# p range(1,1)
# p range(1,2)
# p range(-3,1)

def sum_rec(arr)
    return 0 if arr.empty?
    arr.first + sum_rec(arr[1..-1])
end 

#[1,2,3,4]
# 1 + [2,3,4]
#      2 = [3,4]

def sum(arr)
    sum = 0

    i = 0
    while i < arr.length
        sum += arr[i]
        i+= 1
    end

    sum
end


# p sum_rec([1,2,3,4])


# def exp(base, power)
#     return 1 if power == 0
#     return base if power == 1
#     exp(base, power - 1) * base
# end


# (2,4) => p - 1, base * base
#2,4,8,18
# 2 * 2 

def exp(base, power) #   =====> base * (exp(base,(power - 1)/2.0) ** 2) when its odd
    return 1 if power == 0
    return base if power == 1
    if power % 2 == 0
        exp(base, power - 1) * base # => base ** 2
    else
        base * exp(base,(power - 1)/2) ** 2   #odd(5,3) = 3 * （3 ** 2）
        #    b * (exp(b, (n - 1) / 2) ** 2)     #odd(4,5) = 4 * 256 >> 256  = 1024
    end
end

# p exp(4,5)  #=> 1
# p exp(2,13)  #=> 1
# p exp(4,3)  #=> 1    
# p exp(3,3)  #=> 1
# p exp(2,1)  #=> 2
# p exp(223765,3)  #=> 4
# p exp(2981365,12375)
# p exp(3,3)  #=> 9
# p exp(2, 8)

class Array
    def deep_dup
        return [] if self.empty?
        new_arr = []

        new_arr += [self[0]] + self[1..-1].dup

        new_arr
    end

end

# arr = ["a",["-","b"],"4",["j",["6",["7"]]]]
# arr1 = arr.deep_dup 
#arr = []
# base case = return [] if self.emp?
#arr[0] = 1
# new_arr += arr[0] + arr[1..-1].dup d

# p arr.object_id
# arr1 << 4
# p arr
# p arr.object_id

# p arr1.object_id
# p arr1
# p arr1.object_id


def fib(n)
    return [1] if n == 1 
    return [1, 1] if n == 2
    # arr = [1,1]
    arr = fib(n-1)
    last_fib = arr[-1]
    second_last = arr[-2] 
    arr << last_fib + second_last
end

# def fib(n)
#     return [1] if n == 1
#     arr= [1,1]
#     while arr.length < n
#         arr << arr[-1] + arr[-2]
#     end
#     arr
# end
 #fib(n-1)[-1] + fib(n-1)[-2]

# p fib(3)
# p fib(4)
# p fib(5)
# p fib(8)
# p fib(2)


def bsearch(array, target)
    return nil if !array.include?(target)     
    middle_idx = array.length / 2
    middle_num = array[middle_idx] # => some number in the middle ie [1,2,3,4,5] == 3
    
    if target > middle_num 
        upper_arr = array[middle_idx+1..-1] #we want original index
        bsearch(upper_arr, target) + middle_idx + 1
    elsif target < middle_num
        lower_arr = array[0...middle_idx] 
        bsearch(lower_arr, target)
    else
        middle_idx
    end
    #lower + mid + upper.flatten[idx]
end


# [1,2,3,4,5] = 5 take the upper == bsearch[4,5], 5
  #   (lower)  [1,2]  [3] [4,5] (upper)
#target > middle => upper half
#target < midlle =>

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

class Array

    def merge_sort
        return self if arr.length <= 1

    end

    def merge(arr1, arr2)
        new_arr = []
        arr1.each_index do |i|
            arr2.each_index do |j|
                if arr1[i] < arr2[j] && j > i
                    new_arr += [arr1[i]] + [arr2[j]]
                else
                    new_arr += [arr2[j]] + [arr1[i]]
                end
            end
        end
        new_arr.flatten
    end

end