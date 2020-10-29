def is_prime?(num)
    return false if num < 2
    (2...num).each do |n|
        return false if num % n == 0
    end
true
end

def nth_prime(n)
    num = 1
    count = 0
    while count < n
        num += 1 
        count += 1 if is_prime?(num)
    end
    num
end

def prime_range(min, max)
    arr = []
    (min..max).each do |n|
        arr << n if is_prime?(n)
    end
    arr
end