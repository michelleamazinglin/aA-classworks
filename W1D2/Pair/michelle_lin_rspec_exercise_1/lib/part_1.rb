def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    arr.sum / arr.length.to_f
end

def repeat(str,num)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    r = str.split(" ")
    new_str = []
    (0...r.length).each do |i|
        if i.odd?
            new_str << r[i].downcase
        else
            new_str << r[i].upcase
        end
    end
    new_str.join(" ")
end