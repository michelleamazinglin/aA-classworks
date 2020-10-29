def prime?(num)
    if num < 2
        return false
    end
    (2...num).each do |n|
        if num % n == 0
            return false
        end
    end
    return true
end