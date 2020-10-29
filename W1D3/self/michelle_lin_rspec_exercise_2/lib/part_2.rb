def palindrome?(str)
    if str.length == 1
        return true
    end
    
    word = str[0..-1]
    new_word = ""
    i = -1
    while i >= str.length * -1
        new_word << str[i]
        i -= 1
    end
    new_word == word
end

def substrings(str)
    sub = []
    (0...str.length).each do |s|
        (s...str.length).each do |e|
            sub << str[s..e]
        end
    end
    sub
end

def palindrome_substrings(str)
    temp_arr = substrings(str)
    arr = []
    temp_arr.each do |ele|
        if palindrome?(ele) == true && ele.length > 1
            arr << ele
        end
    end
    arr
end
