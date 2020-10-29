def my_map(arr, &prc)
    new_arr = []
    arr.each {|num| new_arr << prc.call(num) }
    new_arr
end

def my_select(arr, &prc)
    new_arr = []
    arr.each {|num| new_arr << num if prc.call(num) }
    new_arr
end

def my_count(arr, &prc)
    count = 0
    arr.each {|num| count += 1 if prc.call(num) }
    count
end

def my_any?(arr, &prc)
    arr.each {|num| return true if prc.call(num) }
    false
end

def my_all?(arr, &prc)
    arr.each {|num| return false if !prc.call(num) }
    true
end

def my_none?(arr, &prc)
    arr.each {|num| return false if prc.call(num) }
    true
end
