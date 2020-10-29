def is_prime?(n)
    if n < 2
        return false
    end
    i = 2
    while i < n
        if n % i == 0
            return false
        end
        i += 1
    end
    true
end



def nth_prime(n) 

    array = []


    i = 2

    while array.length < n
        if is_prime?(i)
            array << i
        end
        i += 1
    end

    return array[n - 1]

end

def prime_range(min, max)
    arr = []
    i = min
    while i <= max
        if is_prime?(i)
            arr << i
        end
        i += 1
    end
    arr
end