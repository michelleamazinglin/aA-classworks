def element_count(arr) 
    count = Hash.new(0)

    arr.each do |ele|
        count[ele] += 1
    end
    return count
end

require "byebug"

def char_replace!(str, hash)
    str.each_char do |char| 
        if hash.has_key?(char) 
            i = str.index(char)  #char = hash[char]
            str[i] = hash[char] 
        end
        # else
        #     char
        # end
    end
    str
end
#  debugger


def product_inject(arr)

    arr.inject { |acc, el| acc * el}

end



