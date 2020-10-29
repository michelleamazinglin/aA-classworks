# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    num.downto(2) do |n|
        if num % n == 0 && prime?(n)
            return n
        end
    end
end

def prime?(n)
    if n < 2
        return false
    end
    (2...n).each do |factor|
        if n % factor == 0
            return false
        end
    end
    return true
end


def unique_chars?(str)
    count = Hash.new(0)
    str.each_char do |char|
        count[char] += 1
    end
    count.each do |k,v|
        if v > 1
            return false
        end
    end
return true
end


def dupe_indices(arr)
    indices = Hash.new{|h,k| h[k]=[]}
    arr.each_with_index do |ele,i|
        indices[ele] << i
    end
    indices.select {|k,v| v.length > 1}
end

def ana_array(arr1,arr2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    arr1.each do |ele|
        hash1[ele] += 1
    end
    arr2.each do |ele|
        hash2[ele] += 1
    end
    hash1 == hash2
end
