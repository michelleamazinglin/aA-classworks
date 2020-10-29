def my_reject(arr, &proc)
    new_arr = []
    arr.each do |num|
        if proc.call(num) == false
            new_arr << num
        end
    end
    new_arr
end

def my_one?(arr, &proc)
    arr.count {|ele| proc.call(ele)} == 1
end