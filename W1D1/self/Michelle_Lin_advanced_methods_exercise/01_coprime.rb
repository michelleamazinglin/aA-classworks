# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.
# def coprime?(num_1,num_2)
#     arr = []
#     i = 1
#     while i < num_1 && i < num_2
#         if num_1 % i == 0 && num_2 % i == 0
#             arr << i
#         end
#         i += 1
#     end
#     return arr.length == 1
# end

def coprime?(num_1, num_2)
    if divisor(num1).length == 1 && divisor(num_2).length == 1
        return true
    end
    return false
end

def divisor(num)
    arr = []
    (1...num).each do |n|
        if num % n == 0
            arr << n
        end
    end
    return arr


p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
