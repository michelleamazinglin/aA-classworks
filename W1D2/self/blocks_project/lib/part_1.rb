def select_even_nums(arr)
    arr.select {|num| num.even?}
end

def reject_puppies(dogs)
    dogs.reject {|dog| dog["age"] <= 2}
end

def count_positive_subarrays(array)
    array.count {|subarr| subarr.sum > 0}
end

def aba_translate(str)
    new_str = ""
    vowel = "aeiou"
    str.each_char do |char|
        if vowel.include?(char)
            new_str += char + "b" + char
        else
            new_str += char
        end
    end
    new_str
end

def aba_array(arr)
    arr.map {|ele| aba_translate(ele)}
end