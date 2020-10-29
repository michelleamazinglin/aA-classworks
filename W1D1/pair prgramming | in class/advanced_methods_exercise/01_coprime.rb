# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.
def factors(n)
    new_arr = []
    (1...n).each do |i|
        if n % i == 0 
            new_arr << i 
        end
    end
    new_arr 
end

# def coprime?(num_1, num_2)
#     if factors(num_1).length == 1 && factors(num_2).length == 1
#         return true
#     end
#     false
# end
# p factors(25)
# p factors(12)

# def coprime?(num_1, num_2)
#     (2..num_1).each do |n|
#         if num_2 % n == 0
#             p n
#             return false
#         end
#     end
#     true    1 2 3 3 45 6 7 78 8 9 0 
# end

def coprime?(num_1, num_2)
    new_arr = []
    i = 1
    while i < num_1 && i < num_2
        if num_1 % i == 0 && num_2 % i == 0
            new_arr << i 
        end
        i += 1
    end
    new_arr.length == 1
end


p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false


