def my_reject(arr, &prc)
    new_arr = []
    arr.each do |num|
        if prc.call(num) == false
            new_arr << num
        end
    end
    new_arr
end


def my_one?(arr, &prc)

    new_arr = []

    arr.each do |num|
        if prc.call(num) == true
            new_arr << num
        end
    end
    if new_arr.length == 1 
        return true
    else
        return false
    end

end

def hash_select(hash, &prc)
    new_hash = {}
    hash.each do |k,v|
        if prc.call(k, v) == true
            new_hash[k] = v
        end
    end
    new_hash
end

def xor_select(arr, prc1, prc2)
    new_arr = []

    arr.each do |num|
        if prc1.call(num) == true && !(prc2.call(num) == true) || prc2.call(num) == true && !(prc1.call(num) == true)
            new_arr << num
        end
    end
    return new_arr
end

def proc_count(num, arr)
    count = 0
    arr.each do |prc|
        if prc.call(num) == true
            count += 1
        end
    end
    count
end

