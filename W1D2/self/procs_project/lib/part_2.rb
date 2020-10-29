def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    arr = []
    words = str.split(" ")
    words.each do |word|
        arr << prc.call(word)
    end
    arr.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)

    num1 = prc_1.call(num)
    num2 = prc_2.call(num)

    if num1 > num2
        return num1
    else
        return num2
    end
end

def and_selector(arr, proc_1, proc_2)
    newArr = []
    arr.each do |ele|
        if proc_1.call(ele) && proc_2.call(ele)
            newArr << ele
        end
    end
    newArr
end

def alternating_mapper(arr, proc_1, proc_2)
    newArr = []
    arr.each_with_index do |ele, i|
        if i % 2 == 0
            newArr << proc_1.call(ele)
        else
            newArr << proc_2.call(ele)
        end
    end
    newArr
end