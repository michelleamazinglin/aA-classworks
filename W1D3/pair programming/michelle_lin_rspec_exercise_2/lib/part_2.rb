def palindrome?(str)
    reverse = ""
    i = -1
    while (-i) <= str.length
        reverse += str[i]
        i -= 1
    end
   
    reverse == str
end

def substrings(string)
    array = []
    (0...string.length).each do |i1|
        (0...string.length).each do |i2|
            if i1 <= i2
                array << string[i1..i2]
            end
        end
    end
    array
end

def palindrome_substrings(string)
    array = substrings(string)
    answer = []
    array.each do |substring|
        if substring.length > 1 && palindrome?(substring)
            answer << substring
        end
    end
    answer
end




        

#     string.each_char.with_index do |char, idx|
#         i = 0
#         str = ""
#         while i < string.length
#             str += string[idx..i]
#             i += 1
#             array << str
#         end
#     end
#     array
# end

        


        # string.each_char.with_index do |char2, i2|
        #     if i2 > i1
        #         array << char1 + char2
        #     end


