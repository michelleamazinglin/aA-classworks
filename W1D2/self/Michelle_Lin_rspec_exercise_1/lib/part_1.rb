def average(num1,num2)
    avg = (num1 + num2) / 2.0
    avg
end

def average_array(arr)
    avg = arr.sum * 1.0 / arr.length
    avg
end


def repeat(str,num)
    str * num
end

def yell(str)
    new_str = str.upcase + "!"
end

def alternating_case(str)
    words = str.split(" ")
    new_arr = []
    i = 0
    while i < words.length
        words[i] = words[i].upcase
        words[i+1] = words[i+1].downcase
        new_arr << words[i]
        new_arr << words[i+1]
        i += 2
    end
    new_arr.join(" ")
end

