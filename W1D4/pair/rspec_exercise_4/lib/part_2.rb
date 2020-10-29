def proper_factors(num)
    
    new_arr = []

        (1...num).each do |n|
            if num % n == 0 && n > 0
                new_arr << n
            end
        end

    return new_arr 

end

def aliquot_sum(num)
    result = proper_factors(num)
    result.sum
end


def perfect_number?(num)
    aliquot_sum(num) == num
end

def ideal_numbers(n)
    arr = [] # we need to add perfect number in
    i = 0 # index
    x = 1  # number
    while i < n # i = index n= length we should return
        if perfect_number?(x) == true # number is a perfect # or not
            arr << x # perfect number into arr
            i += 1 # index + 1
        end
        x += 1 #num + 1
    end
    arr
end
p ideal_numbers(2)
p ideal_numbers(3)

