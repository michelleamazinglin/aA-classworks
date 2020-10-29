def my_map(arr, &prc)
    newArr = []
    arr.each do |ele|
        newArr << prc.call(ele)
    end
    newArr
end

def my_select(arr, &prc)
    newArr = []
    arr.each do |num|
        if prc.call(num) == true
            newArr << num
        end
    end
    newArr
end

def my_count(arr, &prc)
    count = 0
    arr.each do |ele|
        if prc.call(ele)
            count += 1
        end
    end
    count
end

def my_any?(arr, &prc)
    arr.each do |ele|
        if prc.call(ele)
            return true
        end
    end
    false
end

def my_all?(arr, &prc)
    arr.each do |num|
        if prc.call(num) == false
            return false
        end
    end
    true
end

def my_none?(arr, &prc)
    arr.each do |ele|
        if prc.call(ele) == true
            return false
        end
    end
    true
end